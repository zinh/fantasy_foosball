# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.new(first_name: users(:one).first_name, last_name: users(:one).last_name)
    assert user.valid?
  end

  test "invalid without first_name" do
    user = User.new(last_name: users(:one).last_name)
    refute user.valid?, "user is invalid without first_name"
    assert_not_nil user.errors[:first_name], "no validation error for first_name present"
  end

  test "invalid without last_name" do
    user = User.new(first_name: users(:one).first_name)
    refute user.valid?, "user is invalid without last_name"
    assert_not_nil user.errors[:last_name], "no validation error for last_name present"
  end
end
