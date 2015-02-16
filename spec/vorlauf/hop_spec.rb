require 'spec_helper'

describe Vorlauf::Hop do

  describe '#utilization_factor' do
    context 'pellet' do
      subject(:hop) { Vorlauf::Hop.new(form: 'pellet') }

      it 'returns 1.15' do
        expect(hop.utilization_factor).to eql(1.15)
      end
    end

    context 'plug' do
      subject(:hop) { Vorlauf::Hop.new(form: 'plug') }

      it 'returns 1.08' do
        expect(hop.utilization_factor).to eql(1.08)
      end
    end

    context 'whole' do
      subject(:hop) { Vorlauf::Hop.new(form: 'whole') }

      it 'returns 1' do
        expect(hop.utilization_factor).to eql(1.0)
      end
    end
  end

  describe '#ibu' do
    let(:hop) { Vorlauf::Hop.new(alpha: 14.7, amount: 0.008, time: 60, form: 'pellet') }

    context 'undefined IBU method' do
      it 'raises' do
        expect { hop.ibu(1.041, 10, nil) }.to raise_error(Vorlauf::UndefinedIBUMethod)
      end
    end

    context 'Tinseth' do
      it 'calculates the IBU using the Tinseth formula' do
        expect(Vorlauf::Formulas::Tinseth).to receive(:calculate).with(1.041, 10, 60, 14.7, 0.008).and_return(1)

        hop.ibu(1.041, 10, Vorlauf::Formulas::Tinseth)
      end
    end

    context 'Rager' do
      it 'calculates the IBU using the Rager formula' do
        expect(Vorlauf::Formulas::Rager).to receive(:calculate).with(1.041, 10, 60, 14.7, 0.008).and_return(1)

        hop.ibu(1.041, 10, Vorlauf::Formulas::Rager)
      end
    end
  end

  describe '#aau' do
    let(:hop) { Vorlauf::Hop.new(alpha: 14.7, amount: 0.008) }

    it 'calculates alpha * weight (oz) / vol (gal)' do
      expect(hop.aau(10)).to eql(1.57)
    end
  end

  describe '#hbu' do
    let(:hop) { Vorlauf::Hop.new(alpha: 14.7, amount: 0.008) }

    it 'calculates alpha * weight (oz)' do
      expect(hop.hbu).to eql(4.15)
    end
  end

  describe '#boil?' do
    context 'boil hops' do
      let(:hop) { Vorlauf::Hop.new(use: 'boil') }

      it 'returns true' do
        expect(hop.boil?).to eql(true)
      end
    end

    context 'other hops' do
      let(:hop) { Vorlauf::Hop.new(use: 'dry hop') }

      it 'returns true' do
        expect(hop.boil?).to eql(false)
      end
    end
  end

end
