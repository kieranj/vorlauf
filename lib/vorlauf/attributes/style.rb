module Vorlauf

  module Attributes

    class Style < Virtus::Attribute
      def coerce(value)
        return if value.nil?

        style = if value.match(/[1-26][A-F]/)
          Vorlauf::Style.by_letter(value)
        else
          Vorlauf::Style.by_name(value)
        end

        style
      end
    end

  end

end
