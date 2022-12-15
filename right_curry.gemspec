# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name                  = "right_curry"
  spec.version               = "0.1.0"
  spec.summary               = "For those who want to curry the other way"
  spec.description           = "Now you can"
  spec.authors               = ["Violet Graves"]
  spec.email                 = "violet.graves630@gmail.com"
  spec.files                 = ["lib/right_curry.rb"]
  spec.homepage              = "https://rubygems.org/gems/right_curry"
  spec.license               = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "rubocop", "~> 1.23"
  spec.add_development_dependency "rubocop-rspec"
  spec.metadata = {
    "rubygems_mfa_required" => "true"
  }
end
