module Resize
  module Validation
    module Rules
      module IsBegins
        private
          def is_valid?(all, part)
            all.match(/(\w+)/)[0] == part
          end
      end
    end
  end
end
