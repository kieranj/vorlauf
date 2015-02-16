module Vorlauf

  class Recipe

    include Virtus.model

    attribute :name, String
    attribute :description, String
    attribute :brewer, String
    attribute :asst_brewer, String
    attribute :efficiency, Float, default: 0.75
    attribute :batch_size, Float
    attribute :top_up_water, Float, default: 0
    attribute :evaporation_rate, Float, default: 20
    attribute :serving_size, Float, default: 0.355
    attribute :fermentables, Array[Fermentable]
    attribute :hops, Array[Hop]
    attribute :yeast, Array[Yeast]
    attribute :misc, Array[Misc]
    attribute :mash, Array[Mash]

    attribute :style, Vorlauf::Attributes::Style

    attribute :primary_age, Integer
    attribute :primary_temp, Float
    attribute :secondary_age, Integer
    attribute :secondary_temp, Float
    attribute :tertiary_age, Integer
    attribute :tertiary_temp, Float
    attribute :age, Integer, default: 14
    attribute :age_temp, Float, default: 20.0
    attribute :carbonation_temp, Float, default: 20.0
    attribute :carbonation, Float
    attribute :forced_carbonation, Boolean, default: false
    attribute :priming_sugar_name, String
    attribute :priming_sugar_equiv, String
    attribute :keg_priming_factor, Float
    attribute :boil_time, Integer, default: 60

    def boil_size
      batch_size + ((batch_size + top_up_water) * (evaporation_rate / 100.0) * boil_time / 60)
    end

    def weight
      fermentables.inject(0) do |sum, fermentable|
        sum += fermentable.weight
      end
    end

    def mcu
      fermentables.inject(0) do |sum, fermentable|
        sum += (fermentable.color.value * Util.kilos_to_lbs(fermentable.weight)) / Util.litres_to_gallons(batch_size)
      end
    end

    def eog
      fermentables.inject(1.0) do |sum, fermentable|
        sum += (fermentable.gu(boil_size) * fermentable.efficiency) / 1000.0
      end.round(3)
    end

    def og
      fermentables.inject(1.0) do |sum, fermentable|
        sum += (fermentable.gu(batch_size) * fermentable.efficiency) / 1000.0
      end.round(3)
    end

    def fg
      (og - ((og - 1.0) * attenuation / 100.0)).round(3)
    end

    def abv
       ((og - fg) * 131).round(1)
    end

    def abw
      (abv * 0.79336).round(1)
    end

    def ibu
      hops.inject(0) do |sum, hop|
        sum += hop.ibu(og, batch_size, Vorlauf.configuration.ibu_formula) if hop.boil?
      end.round(1).to_f
    end

    def attenuation
      yeast.first.attenuation
    end

    def rte
      (0.82 * (fg - 1.000) + 0.18 * (og - 1.000)) * 1000.0
    end

    def bv
      (0.8 * ibu / rte).round(2)
    end

    def bu_to_gu
      (ibu / (og - 1.000) / 1000.0).round(2)
    end

    def real_extract
      (0.1808 * Util.sg_to_plato(og)) + (0.8192 * Util.sg_to_plato(fg))
    end

    def calories
      ([0, ((6.9 * abw) + 4.0 * (real_extract - 0.10)) * fg * serving_size * 10].max).to_i
    end

    def color
      Vorlauf.configuration.color.new((1.4922 * (mcu ** 0.6859)).round(1))
    end

    def conforms_to_style?
      return if style.nil?

      style.og.include?(og) &&
      style.fg.include?(fg) &&
      style.ibu.include?(ibu) &&
      style.abv.include?(abv) &&
      style.srm.include?(color)
    end

  end

end
