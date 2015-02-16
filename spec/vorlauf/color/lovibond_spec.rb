require 'spec_helper'

describe Vorlauf::Color::Lovibond do

  subject(:lovibond) { Vorlauf::Color::Lovibond.new(9.94) }

  describe '#to_srm' do
    it 'returns an instance of SRM' do
      expect(lovibond.to_srm).to be_instance_of(Vorlauf::Color::SRM)
    end

    it 'converts 9.94 Lovibond to SRM' do
      expect(lovibond.to_srm.value.round(2)).to eql(12.7)
    end
  end

end
