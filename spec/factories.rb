FactoryGirl.define do
  factory :pale_extract, class: Vorlauf::Fermentable do
    name 'Pale Extract'
    color 3.5
    weight 3.5
    efficiency 1.0
  end

  factory :caramel_60, class: Vorlauf::Fermentable do
    name 'Caramel 60'
    color 60
    efficiency 0.5
  end

  factory :pilsner_malt, class: Vorlauf::Fermentable do
    name 'Pilsner Malt'
    color 1.5
    efficiency 0.75
  end

  factory :cascade, class: Vorlauf::Hop do
    name 'Cascade'
    alpha 5.0
  end

  factory :wyeast_3724, class: Vorlauf::Yeast do
    name 'Wyeast 3724 - Belgian Saison'
    attenuation 80.0
  end

  factory :recipe, class: Vorlauf::Recipe do
    name 't'
    description 'r'
    batch_size 20.0
  end

  factory :extract_recipe, class: Vorlauf::Recipe do
    name 'Extract'
    batch_size 20.0

    after(:build) do |recipe, evaluator|
      recipe.fermentables << build(:pale_extract)
      recipe.hops         << build(:cascade, time: 60, amount: 28)
      recipe.hops         << build(:cascade, time: 10, amount: 14)
      recipe.yeast        << build(:wyeast_3724)
    end
  end

  factory :steep_recipe, class: Vorlauf::Recipe do
    name 'Steep'
    batch_size 20.0

    after(:build) do |recipe, evaluator|
      recipe.fermentables << build(:pale_extract, color: 2.0, weight: 4)
      recipe.fermentables << build(:caramel_60, weight: 0.5, yield: 73)
      recipe.hops         << build(:cascade, time: 60, amount: 28)
      recipe.hops         << build(:cascade, time: 20, amount: 14)
      recipe.hops         << build(:cascade, time: 10, amount: 14)
      recipe.yeast        << build(:wyeast_3724, attenuation: 78.0)
    end
  end

  factory :mash_recipe, class: Vorlauf::Recipe do
    name 'Mash'
    batch_size 20.0

    after(:build) do |recipe, evaluator|
      recipe.fermentables << build(:pilsner_malt, weight: 4.5, yield: 74)
      recipe.hops         << build(:cascade, time: 45, amount: 14, alpha: 7.0)
      recipe.yeast        << build(:wyeast_3724, attenuation: 73.0)
    end
  end

end
