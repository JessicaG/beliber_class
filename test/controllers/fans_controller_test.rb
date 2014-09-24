require 'test_helper'

class FansControllerTest < ActionController::TestCase

  test 'it gets index' do
    get :index

    assert_response :success
  end

  test 'it gets show' do
    fan = Fan.create(name: "Rolando", email: "marabeliber@example.com")
    get :show, {id: fan.id}

    assert_response :success
    assert_not_nil assigns(:fan)
  end

  test 'it posts create' do
    post :create, {name: "Aaron", email: "aaron@example.com"}

    assert_response :redirect
    assert_redirected_to fan_path(assigns(:fan))
  end

end
