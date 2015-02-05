module Resize
  module Validation
    module Rules
      module IsRoman
        private
          def is_valid?(input)
            # Based on Regular Expression Grabbag in the O'Reilly Perl Cookbook, #6.23
            regexp = /^M*(D?C{0,3}|C[DM])(L?X{0,3}|X[LC])(V?I{0,3}|I[VX])$/i
            regexp === input.to_s
          end
      end
    end
  end
end
