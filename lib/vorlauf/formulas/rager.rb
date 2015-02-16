module Vorlauf

  module Formulas

    class Rager < Base

      def calculate
        utilization = (18.11 + 13.86 * Math.tanh((@time - 31.32) / 18.27)).round(1)
        adjustment  = [0, (@early_og - 1.050) / 0.2].max

        a = ((@amount * ((utilization / 100).round(2) * 0.96) * (@alpha / 100)) * 1000)
        # b = (@batch_size * (@early_og + adjustment))
        b = (@batch_size * (1 + adjustment))
        a / b
      end

    end

  end

end
