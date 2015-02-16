require 'virtus'

require 'vorlauf/version'
require 'vorlauf/configuration'
require 'vorlauf/util'

require 'vorlauf/color/srm'
require 'vorlauf/color/ebc'
require 'vorlauf/color/lovibond'

require 'vorlauf/attributes/color'
require 'vorlauf/attributes/style'

require 'vorlauf/fermentable'
require 'vorlauf/hop'
require 'vorlauf/yeast'
require 'vorlauf/mash_step'
require 'vorlauf/mash'
require 'vorlauf/misc'
require 'vorlauf/recipe'

require 'vorlauf/formulas/base'
require 'vorlauf/formulas/tinseth'
require 'vorlauf/formulas/rager'

module Vorlauf

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

end
