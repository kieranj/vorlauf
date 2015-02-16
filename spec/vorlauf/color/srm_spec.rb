require 'spec_helper'

describe Vorlauf::Color::SRM do

  describe '#to_ebc' do
    subject(:srm) { Vorlauf::Color::SRM.new(5) }

    it 'returns an instance of EBC' do
      expect(srm.to_ebc).to be_instance_of(Vorlauf::Color::EBC)
    end

    it 'converts 5 SRM to 9.85 EBC' do
      expect(srm.to_ebc.value).to eql(9.85)
    end
  end

  describe '#to_lovibond' do
    subject(:srm) { Vorlauf::Color::SRM.new(12.7) }

    it 'returns an instance of Lovibond' do
      expect(srm.to_lovibond).to be_instance_of(Vorlauf::Color::Lovibond)
    end

    it 'converts 12.7 SRM to 9.94 Lovibond' do
      expect(srm.to_lovibond.value.round(2)).to eql(9.94)
    end
  end

  describe '#to_rgb' do
    subject(:srm) { Vorlauf::Color::SRM.new(-5) }

    it 'converts SRM to RGB' do
      expect(srm.to_rgb).to eql([255,255,255])
    end
  end

  describe '#to_i' do
    subject(:srm) { Vorlauf::Color::SRM.new(-5) }

    it 'returns an integer' do
      expect(srm.to_i).to eql(-5)
    end
  end

end
