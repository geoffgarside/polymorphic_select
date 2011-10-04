module PolymorphicSelect
  module PolymorphicSelectHelper
    def polymorphic_select(object_name, method, choices, options = {}, html_options = {})
      ActionView::Helpers::InstanceTag.new(object_name, method, self, options.delete(:object)).to_polymorphic_select_tag(choices, options, html_options)
    end
    def grouped_polymorphic_select(object_name, method, choices, options = {}, html_options = {})
      ActionView::Helpers::InstanceTag.new(object_name, method, self, options.delete(:object)).to_grouped_polymorphic_select_tag(choices, options, html_options)
    end
  end
end
