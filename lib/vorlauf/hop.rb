module Vorlauf

  class UndefinedIBUMethod < StandardError; end

  class Hop
    include Virtus.model

    attribute :name, String
    attribute :time, Integer, default: 60
    attribute :alpha, Float, default: 0.0
    attribute :amount, Float, default: 0.025
    attribute :form, String, default: 'pellet'
    attribute :use, String, default: 'boil'
    attribute :notes, String
    attribute :type, String

    def utilization_factor
      if form == 'pellet'
        1.15
      elsif form == 'plug'
        1.08
      else
        1.0
      end
    end

    def ibu(early_og, batch_size, ibu_formula)
      begin
        ibu_formula.calculate(early_og, batch_size, time, alpha, amount) #* utilization_factor
      rescue
        raise UndefinedIBUMethod
      end
    end

    def aau(batch_size)
      (alpha * Util.kilos_to_lbs_ozs(amount)[:oz] / Util.litres_to_gallons(batch_size)).round(2)
    end

    def hbu
      (alpha * Util.kilos_to_lbs_ozs(amount)[:oz]).round(2)
    end

    def boil?
      use == 'boil'
    end
  end
end
