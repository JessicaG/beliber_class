require 'test_helper'
# require 'nyancat-test'

class FanTest < ActiveSupport::TestCase
  test "it creates a fan" do
    result = Fan.create(name: "Ian", email: "ian@example.com")

    assert result
    assert result.name, "Ian"
    assert result.email, "ian@example.com"
  end

  test "it cannot create a fan without an email" do
    result = Fan.create(email: "sariyaki@example.com")

    assert result.invalid?
  end

  test "it cannot create a fan without a name" do
    result = Fan.create(name: "Jim")

    assert result.invalid?
  end

  test 'it cannot create a fan with the same email' do
    2.times { Fan.create(name: 'GOULding', email:'nyancat@example.com') }

    assert_equal 1, Fan.where(email:'nyancat@example.com').count
  end

  test 'it can beliebe' do
    result = Fan.create(name: 'Glen', email:'beliebe20201@example.com')

    assert_equal result.beliebe, 'Glen Belieber'
  end

  test 'it belongs to a location' do

  end
end
