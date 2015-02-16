module Vorlauf

  module Formulas

    class NotImplementedError < StandardError; end

    class Base

      def self.calculate(early_og, batch_size, time, alpha, amount)
        new(early_og, batch_size, time, alpha, amount).calculate
      end

      def initialize(early_og, batch_size, time, alpha, amount)
        @early_og   = early_og
        @batch_size = batch_size
        @time       = time
        @alpha      = alpha
        @amount     = amount
      end

      def calculate
        raise NotImplementedError
      end
    end

  end

end
