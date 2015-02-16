module Vorlauf

  module Color

    class Lovibond

      attr_reader :value

      def initialize(value)
        @value = value
      end

      def to_srm
        SRM.new((@value * 1.3546) - 0.76)
      end
    end

  end

end
