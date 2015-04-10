require 'spec_helper'

RSpec.describe TastyBreadcrumbs::Item do
  before(:each) do
    @title = 'Title of page'
    @url_or_route_helper_method = :admin_root_path
    @item = TastyBreadcrumbs::Item.new @title, @url_or_route_helper_method
  end

  describe 'has method title' do
    it 'returns Title of page' do
      expect(@item.title).to eq(@title)
    end

    it 'return value of to_s method' do
      class TitleObject
        def to_s
          'WoWoW'
        end
      end
      @title = TitleObject.new
      @item  = TastyBreadcrumbs::Item.new @title, @url_or_route_helper_method
      expect(@item.title).to eq('WoWoW')
    end
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
