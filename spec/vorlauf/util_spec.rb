require 'spec_helper'

describe Vorlauf::Util do

  describe '.kilos_to_lbs' do
    it 'converts 1kg to 2.2lbs' do
      expect(Vorlauf::Util.kilos_to_lbs(1)).to eql(2.2)
    end
  end

  describe '.lbs_to_kilos' do
    it 'converts 2.2lbs to 1kg' do
      expect(Vorlauf::Util.lbs_to_kilos(2.2)).to eql(1.0)
    end
  end

  describe '.litres_to_gallons' do
    it 'converts 1 litres to' do
      expect(Vorlauf::Util.litres_to_gallons(1)).to eql(0.26)
    end
  end

  describe '.gallons_to_litres' do
    it 'converts 1 gallon to ' do
      expect(Vorlauf::Util.gallons_to_litres(1)).to eql(3.79)
    end
  end

end
