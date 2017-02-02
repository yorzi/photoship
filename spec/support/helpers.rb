# Dir[Rails.root.join("app/lib/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include Flickr
end
