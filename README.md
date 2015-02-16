# Vorlauf

[![Build Status](https://travis-ci.org/kieranj/vorlauf.svg?branch=master)](https://travis-ci.org/kieranj/vorlauf)

## Installation

Add the gem to your Gemfile

```ruby
gem 'vorlauf'
```

And then execute

```
$ bundle
```

Or install in manually

```
$ gem install vorlauf
```

## Usage

```ruby
  Vorlauf.configure do |config|
    config.ibu_formula = 'Tinseth'
    config.color       = 'SRM'
  end

  recipe = Vorlauf::Recipe.new(name: 'x', batch_size: 20.0)

  recipe.fermentables << Vorlauf::Fermentable.new(name: 'Pilsner Malt', weight: 4.5, yield: 74)
  recipe.hops         << Vorlauf::Hop.new(name: 'Cascade', time: 45, alpha: 7.0, color: 1.5, efficiency: 0.75)
  recipe.yeast        << Vorlauf::Yeast.new(name: 'Wyeast 3724 - Belgian Saison', attenuation: 73)

  recipe.og # => 1.048
  recipe.fg # => 1.013
  recipe.ibu # => 10.6
  recipe.abv # => 4.6
  recipe.abw # => 3.6
```

### Color Units
- SRM
- Lovibond
- EBC

### Formulas

Formulas available for IBU calculation
- Rager
- Tinseth



## License

MIT

## Contributing
