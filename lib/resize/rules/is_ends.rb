module Resize
  module Validation
    module Rules
      module IsEnds
        private
          def is_valid?(all, part)
            all.match(/(\w+)\Z/)[0] == part
          end
      end
    end
  end
end
