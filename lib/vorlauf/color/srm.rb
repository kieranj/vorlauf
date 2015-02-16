module Vorlauf

  module Color

    class SRM

      attr_reader :value

      def initialize(value)
        @value = value
      end

      def to_ebc
        EBC.new(@value * 1.97)
      end

      def to_lovibond
        Lovibond.new((@value + 0.76) / 1.3546)
      end

      def to_rgb
        r = [255, [0, 255 * (0.975 ** @value)].max].min.round
        g = [255, [0, 245 * (0.88 ** @value)].max].min.round
        b = [255, [0, 220 * (0.7 ** @value)].max].min.round

        [r, g, b]
      end

      def to_i
        @value.to_i
      end

    end

  end

end
