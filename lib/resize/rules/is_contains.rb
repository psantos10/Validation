module Resize
  module Validation
    module Rules
      module IsContains
        private
          def is_valid?(all, part)
            all.to_s.include?(part)
          end
      end
    end
  end
end
