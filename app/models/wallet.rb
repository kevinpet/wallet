# A collection of cards, encrypted with the same password.
class Wallet < ActiveRecord::Base
  has_many :pockets
end
