module Vorlauf

  class Fermentable

    include Virtus.model

    attribute :name, String
    attribute :type, String
    attribute :color, Vorlauf::Attributes::Color
    attribute :weight, Float
    attribute :yield, Float, default: 75
    attribute :efficiency, Float, default: 0.75
    attribute :form, String

    def ppg
      (self.yield * 0.46214)#.round
    end

    def gu(litres)
      ppg * Vorlauf::Util.kilos_to_lbs(weight) / Vorlauf::Util.litres_to_gallons(litres)
    end

  end

end
