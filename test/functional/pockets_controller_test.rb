require 'test_helper'

class PocketsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Pocket.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Pocket.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Pocket.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to pocket_url(assigns(:pocket))
  end

  def test_edit
    get :edit, :id => Pocket.first
    assert_template 'edit'
  end

  def test_update_invalid
    Pocket.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Pocket.first
    assert_template 'edit'
  end

  def test_update_valid
    Pocket.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Pocket.first
    assert_redirected_to pocket_url(assigns(:pocket))
  end

  def test_destroy
    pocket = Pocket.first
    delete :destroy, :id => pocket
    assert_redirected_to pockets_url
    assert !Pocket.exists?(pocket.id)
  end
end
