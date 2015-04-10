require 'bundler/setup'
Bundler.setup

require 'tasty_breadcrumbs' # and any other gems you need

RSpec.configure do |config|
  # some (optional) config here
    config.before(:each) do
      allow(Rails).to receive(:application) do
        application = double()
        routes      = double()
        url_helpers = double()
        allow(url_helpers).to receive(:admin_root_path).and_return("/admin")
        allow(url_helpers).to receive(:root_path).and_return("/")
        allow(routes).to receive(:url_helpers).and_return(url_helpers)
        allow(application).to receive(:routes).and_return(routes)
        application
      end
    end

end