module Vorlauf

  class Configuration

    attr_accessor :units, :ibu_formula, :color

    def initialize
      @units       = :metric
      @ibu_formula = Vorlauf::Formulas::Tinseth
      @color       = Vorlauf::Color::SRM
    end

    def ibu_formula=(f)
      @ibu_formula = Object.const_get("Vorlauf::Formulas::#{f}")
    end

    def color=(m)
      @color = Object.const_get("Vorlauf::Color::#{m}")
    end

  end

end
