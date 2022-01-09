# MS Recipes

## Install

### Clone the repository

```shell
git clone https://github.com/flaviohenrique/ms_recipes.git
cd ms_recipes
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.1.0`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.1.0
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```
## Serve

You can start the rails server using the command given below.

```shell
rails s
```
And now you can visit the site with the URL http://localhost:3000

## Running specs

```shell
rspec spec
```