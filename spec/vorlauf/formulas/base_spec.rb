require 'spec_helper'

describe Vorlauf::Formulas::Base do

  describe '#calculate' do
    it 'raises NotImplementedError' do
      expect {
        Vorlauf::Formulas::Base.calculate(1.041, 10, 60, 5.5, 14)
      }.to raise_error(Vorlauf::Formulas::NotImplementedError)
    end
  end

end
