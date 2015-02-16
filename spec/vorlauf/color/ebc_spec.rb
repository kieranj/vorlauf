require 'spec_helper'

describe Vorlauf::Color::EBC do

  subject(:ebc) { Vorlauf::Color::EBC.new(9.85) }

  describe '#to_srm' do
    it 'converts 9.85 EBC to SRM' do
      expect(ebc.to_srm.value).to eql(5.0)
    end
  end

end
