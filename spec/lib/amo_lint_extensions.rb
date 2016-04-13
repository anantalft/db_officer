
module ActiveModel
  module Lint
    module Tests
      module Validations

        VALIDATION_METHODS = %w[
          validates
        ]

        VALIDATION_METHODS.each do |validation_method|
          define_method "test_#{validation_method}" do
            assert model.class.respond_to?(validation_method)
          end
        end

      end
    end
  end
end
