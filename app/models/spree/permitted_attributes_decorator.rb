module Spree
  module PermittedAttributesDecorator
    def self.prepended(base)
      base.address_attributes.push(:firstname_kana, :lastname_kana)
    end
  end

  Spree::PermittedAttributes.prepend(PermittedAttributesDecorator)
end
