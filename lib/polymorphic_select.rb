require "polymorphic_select/version"
require "polymorphic_select/instance_tag_ext"
require "polymorphic_select/form_builder_ext"
require "polymorphic_select/helper"
require "polymorphic_select/multiparameter_assignment_ext"

module PolymorphicSelect #:nodoc:

  class Engine < ::Rails::Engine
    initializer "polymorphic_select.initialize" do
      config.to_prepare do
        ActiveRecord::Base.send :include, MultiparameterAssignmentExt
        ActionView::Helpers::InstanceTag.send :include, InstanceTagExt
        ActionView::Helpers::FormBuilder.send :include, FormBuilderExt
        ActionView::Base.send :include, PolymorphicSelectHelper
      end
    end
  end

end
