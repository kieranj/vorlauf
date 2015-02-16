require 'spec_helper'

describe Vorlauf::Recipe do

  context 'extract recipe' do
    subject(:recipe)  { build(:extract_recipe) }

    it 'returns the total weight of fermentables' do
      expect(recipe.weight).to eql(3.5)
    end

    it 'calculates the mcu' do
      expect(recipe.mcu.round).to eql(5)
    end

    it 'calculates an SRM of 4.6' do
      expect(recipe.color.value).to eql(4.6)
    end

    it 'calculates boil size of ' do
      expect(recipe.boil_size).to eql(24.0)
    end

    it 'calculates EOG as' do
      expect(recipe.eog).to eql(1.042)
    end

    it 'calculates OG as 1.051' do
      expect(recipe.og).to eql(1.051)
    end

    it 'calculates FG as 1.010' do
      expect(recipe.fg).to eql(1.010)
    end

    it 'calculates the ABV as 5.4%' do
      expect(recipe.abv).to eql(5.4)
    end

    it 'calculates the ABW as 4.3' do
      expect(recipe.abw).to eql(4.3)
    end

    it 'calculates the IBU as 14' do
      expect(recipe.ibu).to eql(18.9)
    end

    it 'calculates BU:GU as 0.37' do
      expect(recipe.bu_to_gu).to eql(0.37)
    end

    it 'calculates BV as 0.64' do
      expect(recipe.bv).to eql(0.87)
    end

    it 'calculates calories as 168 kcal' do
      expect(recipe.calories).to eql(168)
    end
  end

  context 'steep recipe' do
    subject(:recipe)  { build(:steep_recipe) }

    before do
      Vorlauf.configure { |b| b.ibu_formula = 'Rager' }
    end

    it 'returns the total weight of fermentables' do
      expect(recipe.weight).to eql(4.5)
    end

    it 'calculates the mcu' do
      expect(recipe.mcu.round).to eql(16)
    end

    it 'calculates an SRM of 9.9' do
      expect(recipe.color.value).to eql(9.9)
    end

    it 'calculates OG as 1.061' do
      expect(recipe.og).to eql(1.061)
    end

    it 'calculates FG as 1.014' do
      expect(recipe.fg).to eql(1.013)
    end

    it 'calculates the ABV as 6.3%' do
      expect(recipe.abv).to eql(6.3)
    end

    it 'calculates the ABW as 4.3' do
      expect(recipe.abw).to eql(5.0)
    end

    it 'calculates the IBU as 25.5' do
      expect(recipe.ibu).to eql(25.5)
    end

    it 'calculates BU:GU as 0.42' do
      expect(recipe.bu_to_gu).to eql(0.42)
    end

    it 'calculates BV as 0.94' do
      expect(recipe.bv).to eql(0.94)
    end

    it 'calculates calories as 168 kcal' do
      expect(recipe.calories).to eql(200)
    end
  end

  context 'all grain recipe' do
    subject(:recipe)  { build(:mash_recipe) }

    before do
      Vorlauf.configure { |b| b.ibu_formula = 'Tinseth' }
    end

    it 'returns the total weight of fermentables' do
      expect(recipe.weight).to eql(4.5)
    end

    it 'calculates the mcu' do
      expect(recipe.mcu.round).to eql(3)
    end

    it 'calculates an SRM of 3.0' do
      expect(recipe.color.value).to eql(3.0)
    end

    it 'calculates OG as 1.048' do
      expect(recipe.og).to eql(1.048)
    end

    it 'calculates FG as 1.013' do
      expect(recipe.fg).to eql(1.013)
    end

    it 'calculates the ABV as 4.6%' do
      expect(recipe.abv).to eql(4.6)
    end

    it 'calculates the ABW as 3.6' do
      expect(recipe.abw).to eql(3.6)
    end

    it 'calculates the IBU as 10.6' do
      expect(recipe.ibu).to eql(10.6)
    end

    it 'calculates BU:GU as 0.24' do
      expect(recipe.bu_to_gu).to eql(0.22)
    end

    it 'calculates BV as 0.44' do
      expect(recipe.bv).to eql(0.44)
    end

    it 'calculates calories as 168 kcal' do
      expect(recipe.calories).to eql(157)
    end
  end

  describe '#conforms_to_style?' do
    context 'when no style is present' do
      let(:recipe) { Vorlauf::Recipe.new }

      it 'returns false' do
        expect(recipe.conforms_to_style?).to be_falsey
      end
    end

    context 'when style is present' do
      context 'when all conditions are matched' do
        it 'returns true' do
          expect(recipe.conforms_to_style?).to be_truthy
        end
      end

      context 'when not all conditions are matched' do
        it 'returns false' do
          expect(recipe.conforms_to_style?).to be_falsey
        end
      end
    end
  end

end
