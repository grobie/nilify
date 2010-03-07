module Grobie
  module Nilify

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def nilify(*attributes)
        return if attributes.empty?

        unless self.included_modules.include?(Nilify::InstanceMethods)
          include Nilify::InstanceMethods
          class_inheritable_reader :nilify_attributes
        end

        columns = self.content_columns.select { |c| attributes.map { |a| a.to_sym }.include?(c.name.to_sym) }
        write_inheritable_array :nilify_attributes, columns.map { |a| a.name.to_sym }

        class_eval "before_validation :nilify"
      end
    end

    module InstanceMethods
      def nilify
        self.class.nilify_attributes.each do |attribute|
          value = read_attribute(attribute)

          if (value.is_a?(String)  && value.blank?) ||
             (value.is_a?(Numeric) && value.zero?)  ||
             (value.is_a?(Time)    && (value.to_i.zero? || (value.to_i + value.utc_offset).zero?))
            write_attribute(attribute, nil)
          end
        end
      end
    end

  end
end