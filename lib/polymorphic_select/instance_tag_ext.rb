require "polymorphic_selector"

module PolymorphicSelect
  module InstanceTagExt
    extend ActiveSupport::Concern

    def to_polymorphic_select_tag(choices, options = {}, html_options = {})
      polymorphic_selector(choices, options, html_options).select_polymorph.html_safe
    end
    def to_grouped_polymorphic_select_tag(choices, options = {}, html_options = {})
      polymorphic_selector(choices, options, html_options).select_polymorph.html_safe
    end
    protected
      def polymorphic_selector(choices, options, html_options)
        polymorph = value(object)
        @auto_index ||= nil

        options = options.dup
        options[:field_name]   = @method_name
        options[:prefix]     ||= @object_name
        options[:index]        = @auto_index if @auto_index && !options.has_key?(:index)

        PolymorphicSelector.new(polymorph, choices, options, html_options)
      end
  end
end
