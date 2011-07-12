#encoding: utf-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_correios_shipping'
  s.version     = '1.0.0'
  s.summary     = 'Extensão para cálculo de frete pelos correios'
  s.description = 'Extensão para cálculo de frete pelos correios'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Thiago Temple'
  s.email             = 'vintem@gmail.com'
  s.homepage          = 'http://github.com/vintem/spree-correios-shipping'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '>= 0.60.0')
  s.add_dependency('correios-frete')
end
