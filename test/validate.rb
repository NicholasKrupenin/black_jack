module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods

    def validate(attr_name, validation_type, *params)
      @validations ||= []
      @validations << {name: attr_name, type: validation_type, attr_params: params}
    end
  end

  module InstanceMethods

    def validate!

      self.class.instance_variable_get("@validations").each do |value|
        attr_value = instance_variable_get("@#{value[:name]}")
        attr_param = value[:attr_params].first
        send("validate_#{value[:type]}", attr_value, attr_param)
      end
    end


    def validate_presence(value, _)
      raise StandardError, "The value cannot be empty!" if value.nil? || value.empty?
    end

    def validate_format(value, format)
      raise StandardError,  "The value does not match the specified format!" if value !~ format
    end
  end
end
