module PolymorphicSelect
  module FormBuilderExt
    def polymorphic_select(method, choices, options = {}, html_options = {})
      @template.polymorphic_select(@object_name, method, choices, objectify_options(options), html_options)
    end
    def grouped_polymorphic_select(method, choices, options = {}, html_options = {})
      @template.grouped_polymorphic_select(@object_name, method, choices, objectify_options(options), html_options)
    end
  end
end
