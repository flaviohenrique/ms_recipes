require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /recipes/:id', :vcr do
    let(:recipe_attrs) do
      {
        title: "Crispy Chicken and Rice\twith Peas & Arugula Salad",
        description: 'Crispy chicken skin, tender meat, and rich, tomatoey sauce form a winning trifecta of delicious in this one-pot braise. We spoon it over rice and peas to soak up every last drop of goodness, and serve a tangy arugula salad alongside for a vibrant boost of flavor and color. Dinner is served! Cook, relax, and enjoy!',
        image_url: '//images.ctfassets.net/kk2bw5ojx476/5mFyTozvSoyE0Mqseoos86/fb88f4302cfd184492e548cde11a2555/SKU1479_Hero_077-71d8a07ff8e79abcb0e6c0ebf0f3b69c.jpg?w=300&h=300&q=100',
        tags: ['gluten free', 'healthy'],
        chef_name: 'Jony Chives'
      }
    end

    before do
      get '/recipes/437eO3ORCME46i02SeCW46'
    end

    it 'expects a success' do
      expect(response).to have_http_status(:success)
    end

    it 'expects to render "index" template' do
      expect(response).to render_template('recipes/show')
    end

    it 'expects to set recipe' do
      recipe = assigns(:recipe)

      expect(recipe).to have_attributes(recipe_attrs)
    end
  end

  describe 'GET /', :vcr do
    context 'when get without params' do
      before do
        get '/'
      end

      it 'expects a success' do
        expect(response).to have_http_status(:success)
      end

      it 'expects to render "index" template' do
        expect(response).to render_template('recipes/index')
      end

      it 'expects to assigns recipes' do
        title = 'White Cheddar Grilled Cheese with Cherry Preserves & Basil'
        recipes = assigns(:recipes)

        expect(recipes.first.title).to eq(title)
      end

      it 'expects to assigns paginator with total count' do
        pagy = assigns(:pagy)

        expect(pagy.count).to eq(4)
      end

      it 'expects to assigns paginator with max page' do
        pagy = assigns(:pagy)

        expect(pagy.page).to eq(1)
      end
    end

    context 'when get a second page from params' do
      before do
        get '/?page=2'
      end

      it 'expects to assigns recipes with page 2 data' do
        title = 'Grilled Steak & Vegetables with Cilantro-Jalapeño Dressing'
        recipes = assigns(:recipes)

        expect(recipes.first.title).to eq(title)
      end

      it 'expects to assigns paginator with current page' do
        pagy = assigns(:pagy)

        expect(pagy.page).to eq(2)
      end
    end

    context 'when get a unexistent page from params' do
      before do
        get '/?page=4'
      end

      it 'expects to assigns recipes with page 2 data' do
        recipes = assigns(:recipes)

        expect(recipes.size).to eq(0)
      end

      it 'expects to assigns paginator' do
        pagy = assigns(:pagy)

        expect(pagy).to be_nil
      end
    end

    context 'when get with a per_page from params' do
      before do
        get '/?per_page=10'
      end

      it 'expects to assigns recipes with all data size' do
        recipes = assigns(:recipes)

        expect(recipes.size).to eq(4)
      end

      it 'expects to assigns recipes with all data contents' do
        title = "Crispy Chicken and Rice\twith Peas & Arugula Salad"
        recipes = assigns(:recipes)

        expect(recipes.last.title).to eq(title)
      end
    end
  end
end
