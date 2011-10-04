require 'action_view/helpers'

module PolymorphicSelect
  class PolymorphicSelector
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::FormOptionsHelper

    def initialize(polymorph, choices, options = {}, html_options = {})
      @polymorph    = polymorph
      @choices      = choices
      @options      = options.dup
      @html_options = html_options.dup
    end

    def select_polymorph
      build_options_and_select(selected_value, @choices)
    end

    protected
      def selected_value
        return if @polymorph.nil?
        "#{@polymorph.class.model_name}:#{@polymorph.id}"
      end
      def build_options_and_select(selected, choices, options = {})
        build_select(build_options(selected, choices, options))
      end
      def build_options(selected, choices, options = {})
        options_for_select(choices, selected) + "\n"
      end
      def build_select(select_options_as_html)
        select_options = {
          :id => input_id,
          :name => input_name
        }.merge(@html_options)
        select_options.merge!(:disabled => 'disabled') if @options[:disabled]

        select_html = "\n"
        select_html << content_tag(:option, '', :value => '') + "\n" if @options[:include_blank]
        select_html << select_options_as_html

        (content_tag(:select, select_html.html_safe, select_options) + "\n").html_safe
      end
      def input_name
        prefix = @options[:prefix] || ''
        prefix += "[#{@options[:index]}]" if @options.has_key?(:index)

        field_name = @options[:field_name] || ''
        field_name += "(1)"

        @options[:discard_type] ? prefix : "#{prefix}[#{field_name}]"
      end
      def input_id
        input_name.gsub(/([\[\(])|(\]\[)/, '_').gsub(/[\]\)]/, '')
      end
  end  
end
