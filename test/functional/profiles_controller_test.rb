require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:chema).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "deberia mostrar un 404 si el profile no existe" do
  	get :show, id: "no existe"
  	assert_response :not_found
  end

  test "Variables asignadas cuando se esta viendo el profile" do
  	get :show, id: users(:chema).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "Solo muestra los status de los usuarios correctos" do
  	get :show, id: users(:chema).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:chema), status.user
  	end
  end

end
