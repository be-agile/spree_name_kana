module Spree
  module UserDecorator
    def self.prepended(base)
      base.attr_accessor :lastname_kana, :firstname_kana
    end
  end

  User.prepend(UserDecorator)
end
