# Associates a wallet to a user. Breaking metaphor, a wallet may be in
# many pockets at once.
class Pocket < ActiveRecord::Base
  # Access levels :rw, :ro
  attr_accessible :user, :wallet, :access
  belongs_to :user
  belongs_to :wallet

  def writable?
    access == :rw
  end
end
