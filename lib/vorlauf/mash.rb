module Vorlauf

  class Mash

    include Virtus.model

    attribute :name, String
    attribute :grain_temp, Float
    attribute :sparge_temp, Float
    attribute :ph, Float
    attribute :notes, String
    attribute :mash_steps, Array[MashStep]

  end

end
