require 'test_helper'

class PocketTest < ActiveSupport::TestCase
  fixtures :pockets, :users, :wallets

  def test_find_wallets
    wallets = users(:alice).wallets
    assert_equal Set.new([wallets(:one), wallets(:two)]), Set.new(wallets)
  end

  def test_should_be_valid
    assert Pocket.new.valid?
  end
end
