class TastyBreadcrumbs::Main

  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(title, path)
    items.push TastyBreadcrumbs::Item.new(title, path)
  end

  def render(tasty_breadcrumbs_template)
    printer = TastyBreadcrumbs::Printer.new  tasty_breadcrumbs_template.container,
                                                                    tasty_breadcrumbs_template.simple_item,
                                                                    tasty_breadcrumbs_template.last_item
    printer.render_items(items)
  end

end
