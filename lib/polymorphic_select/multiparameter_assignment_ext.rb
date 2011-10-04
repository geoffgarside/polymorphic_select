# TODO: Write code to inject into multiparameter_assignment process

# This code needs to determine what multiparameter assignments are
# actually related to assocations rather than aggregations. If they
# are associations then it needs to extract them from the list of
# pairs and handle them separately.

module PolymorphicSelect
  module MultiparameterAssignmentExt
    private
      def read_value_from_parameter(name, values_hash_from_param)
        begin
          super(name, values_hash_from_param)
        rescue NoMethodError => e
          reflection = self.class.reflect_on_association(name.to_sym)
          raise e if reflection.nil? || reflection.options[:polymorphic] != true
          read_polymorphic_parameter_value(name, values_hash_from_param)
        end
      end
      def read_polymorphic_parameter_value(name, values_hash_from_param)
        polymorphic_type, polymorphic_id = values_hash_from_param[1].split(':', 2)
        polymorphic_klass = Object.const_get(polymorphic_type) rescue nil
        return if polymorphic_klass.nil?

        polymorphic_klass.find(polymorphic_id) rescue nil
      end
  end
end
