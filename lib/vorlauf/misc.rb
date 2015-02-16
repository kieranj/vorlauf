module Vorlauf

  class Misc

    include Virtus.model

    attribute :name, String
    attribute :type, String
    attribute :use, String
    attribute :time, Integer
    attribute :amount, Float
    attribute :use_for, String
    attribute :notes, String

  end

end
