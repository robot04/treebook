require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "un usuario deberia introducir su nombre" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end
	test "un usuario deberia introducir su apellido" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end
	test "un usuario deberia introducir su profile name" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end
	test "el usuario tiene un profile name unico" do
		user = User.new
		user.profile_name = users(:chema).profile_name

		assert !user.save
		assert !user.errors[:profile_name].empty?
	end
	test "El formato de usuario deberia ser correcto" do
		user = User.new
		user.profile_name = "My profile name with spaces"
		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Profile name must be formatted correctly")
	end
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  profile_name           :string(255)
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#

