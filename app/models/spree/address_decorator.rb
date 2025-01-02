module Spree
  module AddressDecorator
    def self.prepended(base)
      base.const_set(:ADDRESS_FIELDS, %w(firstname lastname firstname_kana lastname_kana company address1 address2 city state zipcode country phone))

      base.attribute :firstname_kana, :string
      base.attribute :lastname_kana, :string

      base.validates :firstname_kana, presence: true, format: { with: /\A[ァ-ンﾞ－・ー\s　]+\z/ }
      base.validates :lastname_kana, presence: true, format: { with: /\A[ァ-ンﾞ－・ー\s　]+\z/ }
    end
  end

  Spree::Address.prepend(AddressDecorator)
end
