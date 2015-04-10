class TastyBreadcrumbs::Template
  DEFAULT_CONTAINER_TEMPLATE   = 'ol.breadcrumb'
  DEFAULT_SIMPLE_ITEM_TEMPLATE = 'li a'
  DEFAULT_LAST_ITEM_TEMPLATE   = 'li'

  attr_accessor :container, :simple_item, :last_item

  def initialize(container, simple_item, last_item)
    @container   = container
    @simple_item = simple_item
    @last_item   = last_item
  end
end
