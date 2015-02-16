module Vorlauf

  module Util

    def self.kilos_to_lbs(kg)
      (kg * 2.20462).round(2)
    end

    def self.kilos_to_lbs_ozs(kg)
      lb = kg * 2.20462

      { lb: lb.floor, oz: (lb - lb.floor) * 16 }
    end

    def self.lbs_to_kilos(lb)
      (lb / 2.20462).round(2)
    end

    def ozs_to_kilos(ozs)
      Util.lbs_to_kilos(ozs / 16)
    end

    def self.litres_to_gallons(lt)
      (lt * 0.264172).round(2)
    end

    def self.gallons_to_litres(g)
      (g / 0.264172).round(2)
    end

    def self.hydrometer_correction(temp, gravity)
      correction = 1.313454 - 0.132674*temp + 0.002057793*temp*temp - 0.000002627634*temp*temp*temp
      (gravity + (correction * 0.001)).round(3)
    end

    def self.sg_to_plato(sg)
      ((-1 * 616.868) + (1111.14 * sg) - (630.272 * sg*sg) + (135.997 * sg*sg*sg)).round(1)
    end

  end

end
