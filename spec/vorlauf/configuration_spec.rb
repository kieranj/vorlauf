require 'spec_helper'

describe Vorlauf::Configuration do
  let(:config) { Vorlauf::Configuration.new }

  describe '#units' do
    it 'default value is :metric' do
      expect(config.units).to eql(:metric)
    end
  end

  describe '#units=' do
    it 'can set the value' do
      expect {
        config.units = :us
      }.to change(config, :units).from(:metric).to(:us)
    end
  end

  describe '#ibu_formula' do
    it 'default value is Tinseth' do
      expect(config.ibu_formula).to eql(Vorlauf::Formulas::Tinseth)
    end
  end

  describe '#ibu_formula=' do
    it 'can set the value' do
      expect {
        config.ibu_formula = 'Rager'
      }.to change(config, :ibu_formula).from(Vorlauf::Formulas::Tinseth).to(Vorlauf::Formulas::Rager)
    end
  end

  describe '#color' do
    it 'default value is SRM' do
      expect(config.color).to eql(Vorlauf::Color::SRM)
    end
  end

  describe '#color=' do
    it 'default value is SRM' do
      expect {
        config.color = 'EBC'
      }.to change(config, :color).from(Vorlauf::Color::SRM).to(Vorlauf::Color::EBC)
    end
  end
end

describe '#configure' do
  it 'yields an instance of Vorlauf::Configuration' do
    expect { |b|
      Vorlauf.configure(&b)
    }.to yield_with_args(Vorlauf.configuration)
  end
end
