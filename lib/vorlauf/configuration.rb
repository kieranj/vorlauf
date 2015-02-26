module Vorlauf

  class Configuration

    attr_accessor :units, :ibu_formula, :color

    def initialize
      @units       = :metric
      @ibu_formula = Vorlauf::Formulas::Tinseth
      @color       = Vorlauf::Color::SRM
    end

    def ibu_formula=(f)
      @ibu_formula = Vorlauf::Formulas.const_get(f)
    end

    def color=(m)
      @color = Vorlauf::Color.const_get(m)
    end

  end

end
