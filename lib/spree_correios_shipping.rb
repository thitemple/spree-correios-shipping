require 'spree_core'
require 'spree_correios_shipping_hooks'

module SpreeCorreiosShipping
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/models/calculator/**/*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
      
      Dir.glob(File.join(File.dirname(__FILE__), "spree/**/*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
      
      [Shipping::Sedex, Shipping::Sedex10, Shipping::SedexHoje, Shipping::Pac, Shipping::Esedex].each(&:register)
      
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
