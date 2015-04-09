module TastyBreadcrumbs::ActionController
  extend ActiveSupport::Concern

  included do
    before_action :setup_tasty_breadcrumbs
    helper_method :display_tasty_breadcrumbs
  end


  class_methods do
    def add_breadcrumb(item, path)
      before_filter do |controller|
        controller.send(:add_breadcrumb, item, path)
      end
    end
  end

  def setup_tasty_breadcrumbs
    @tasty_breadcrumbs = TastyBreadcrumbs::Main.new
    @tasty_breadcrumbs_template = TastyBreadcrumbs::Template.new  TastyBreadcrumbs::Printer::DEFAULT_CONTAINER_TEMPLATE,
                                                                  TastyBreadcrumbs::Printer::DEFAULT_SIMPLE_ITEM_TEMPLATE,
                                                                  TastyBreadcrumbs::Printer::DEFAULT_LAST_ITEM_TEMPLATE 
  end
  
  def add_breadcrumb(item, path)
    @tasty_breadcrumbs.add_item(item, path)
  end

  [:container, :simple_item, :last_item].each do |template_item|
    method_name = "set_#{template_item}_template" #set_container_template, set_simple_item_template, set_last_item_template

    define_method method_name do |value|
      @tasty_breadcrumbs_template.send("#{template_item}=", value)
    end   
    
    define_singleton_method method_name do |value|
      before_filter do |controller|
        controller.send(method_name, value)
      end
    end
  end


  def display_tasty_breadcrumbs
    @tasty_breadcrumbs.render(@tasty_breadcrumbs_template)
  end



end
