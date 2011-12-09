require 'test_helper'

class WalletsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Wallet.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Wallet.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Wallet.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to wallet_url(assigns(:wallet))
  end

  def test_edit
    get :edit, :id => Wallet.first
    assert_template 'edit'
  end

  def test_update_invalid
    Wallet.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Wallet.first
    assert_template 'edit'
  end

  def test_update_valid
    Wallet.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Wallet.first
    assert_redirected_to wallet_url(assigns(:wallet))
  end

  def test_destroy
    wallet = Wallet.first
    delete :destroy, :id => wallet
    assert_redirected_to wallets_url
    assert !Wallet.exists?(wallet.id)
  end
end
