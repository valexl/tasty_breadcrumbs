require 'spec_helper'


RSpec.describe TastyBreadcrumbs::Template do
  before(:each) do
    @template = TastyBreadcrumbs::Template.new TastyBreadcrumbs::Printer::DEFAULT_CONTAINER_TEMPLATE,
                                                                     TastyBreadcrumbs::Printer::DEFAULT_SIMPLE_ITEM_TEMPLATE,
                                                                     TastyBreadcrumbs::Printer::DEFAULT_LAST_ITEM_TEMPLATE
  end
  describe 'has method' do
    it 'container and container=' do
      @template.container = 'div.container ul.my_breadcrumbs'
      expect(@template.container).to eq('div.container ul.my_breadcrumbs')
    end

    it 'simple_item and simple_item=' do
      @template.simple_item = 'li.simple_item span a'
      expect(@template.simple_item).to eq('li.simple_item span a')
    end

    it 'last_item and last_item=' do
      @template.last_item = 'li.last_item'
      expect(@template.last_item).to eq('li.last_item')
    end
  end
end