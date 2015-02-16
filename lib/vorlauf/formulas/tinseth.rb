module Vorlauf

  module Formulas

    class Tinseth < Base

      def calculate
        bigness_factor = 1.65 * (0.000125 ** (@early_og - 1.0))
        boil_factor    = (1 - Math::E ** (-0.04 * @time)) / 4.15
        utilization    = (bigness_factor * boil_factor)
        alpha_acids    = ((@alpha / 100.0) * @amount * 1000) / @batch_size

        utilization * alpha_acids
      end

    end

  end

end
