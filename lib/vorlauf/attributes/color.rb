module Vorlauf

  module Attributes

    class Color < Virtus::Attribute
      def coerce(value)
        Vorlauf::Color::SRM.new(value)
      end
    end

  end

end
