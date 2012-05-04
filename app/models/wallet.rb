# A collection of cards, encrypted with the same password.
class Wallet < ActiveRecord::Base
  has_many :pockets
  def filename
    "#{id}-#{name.underscore}.json"
  end
end
