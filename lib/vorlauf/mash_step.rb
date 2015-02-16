module Vorlauf

  class MashStep

    include Virtus.model

    MashTypes = ['Infusion', 'Temperature', 'Decoction']

    attribute :name, String
    attribute :type, String
    attribute :description, String
    attribute :water_ratio, Float
    attribute :step_time, Integer
    attribute :step_temp, Float
    attribute :end_temp, Float
    attribute :ramp_time, Integer
    attribute :infuse_amount, Float
    attribute :decoction_amount, Float

  end

end
