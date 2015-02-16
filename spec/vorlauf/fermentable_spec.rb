require 'spec_helper'

describe Vorlauf::Fermentable do

  describe '#color' do
    subject(:fermentable) { Vorlauf::Fermentable.new(name: 'epm', color: 3.5, weight: 3.5, yield: 78) }

    it 'returns an SRM' do
      expect(fermentable.color).to be_instance_of(Vorlauf::Color::SRM)
    end
  end

  describe '#gu' do
    subject(:fermentable) { Vorlauf::Fermentable.new(name: 'epm', color: 3.5, weight: 1, yield: 75) }

    let(:litres) { Vorlauf::Util.gallons_to_litres(1) }

    it 'calculate GU of 1kg @ 75% yield as 76.3 per gallon' do
      expect(fermentable.gu(litres).round(1)).to eql(76.3)
    end
  end

end
