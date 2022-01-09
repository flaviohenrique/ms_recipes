Dry::Rails.container do |_a|
  config.component_dirs.add 'app/domain'
  config.component_dirs.add 'app/services'

  credentials = namespace(:credentials) do
    register(:config) { Rails.application.credentials.config }
  end

  namespace(:contentful) do
    register(:client) do
      config = credentials.resolve('credentials.config')

      Contentful::Client.new(
        space: config[:contentful][:space],
        access_token: config[:contentful][:access_token]
      )
    end
  end
end
