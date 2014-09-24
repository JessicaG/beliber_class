require 'test_helper'
# require 'nyancat-test'

class LocationTest < ActiveSupport::TestCase

  test 'it requires a city' do
    result = Location.create(city: 'Denver')

    assert result
    assert result.city, 'Denver'
  end

  test 'it requires a country' do
    result = Location.create(country: 'USA')

    assert result
    assert result.country, 'USA'
  end

  test 'it requires a state' do
    result = Location.create(state: 'CO')
    assert result
    assert result.state, 'CO'
  end

  test "it doesn't save without all fields filled in" do
    result = Location.create(city:'Denver', state:'CO', country:'USA')

    assert result.valid?
  end

  test 'do not save location unless city is unique' do
    2.times { Location.create(city:'Denver', state:'CO', country:'USA')}

    assert_equal 1, Location.where(city:'Denver').count
  end

  test 'it can beliebe' do
    result = Location.create(city:'Denver', state:'CO', country:'USA')

    assert_equal result.beliebe, 'Denver Beliebers'
  end

  test 'it has many fans' do
    location = Location.create(city:'Denver', state:'CO', country:'USA')
    fan     = location.fans.create(name: 'Luke', email: 'themostbeliebers@example.com')

    assert location.fans
    assert_equal 1, location.fans.count
    assert_includes location.fans, fan
  end



end
