module Resize
  module Validation
    module Rules
      module IsEquals
        private
          def is_valid?(input, value)
            input == value
          end
      end
    end
  end
end