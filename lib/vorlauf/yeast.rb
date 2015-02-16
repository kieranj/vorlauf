module Vorlauf

  class Yeast
    include Virtus.model

    Types = ['Ale', 'Lager']
    Forms = ['Liquid', 'Dry']

    attribute :name, String
    attribute :type, String, default: 'Ale'
    attribute :form, String, default: 'Liquid'
    attribute :attenuation, Float, default: 75.0
  end

end
