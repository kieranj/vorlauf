module Vorlauf

  module Color

    class EBC

      attr_reader :value

      def initialize(value)
        @value = value
      end

      def to_srm
        EBC.new(@value / 1.97)
      end

    end

  end

end
