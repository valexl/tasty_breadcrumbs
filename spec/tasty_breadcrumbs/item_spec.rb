require 'spec_helper'

RSpec.describe TastyBreadcrumbs::Item do
  before(:each) do
    @title = 'Title of page'
    @url_or_route_helper_method = :admin_root_path
    @item = TastyBreadcrumbs::Item.new @title, @url_or_route_helper_method
  end

  it 'has method title returns Title of page' do
    expect(@item.title).to eq(@title)
  end

  describe 'has_method url' do
    it 'try execute route helper if url_or_route_helper_method is symbol' do
      expect(@item.url).to eq('/admin')
    end
    
    it 'nothing do if url_or_route_helper_method is string' do
      @item = TastyBreadcrumbs::Item.new @title, '/some_string_is_path'
      expect(@item.url).to eq('/some_string_is_path')
    end
  end
end
