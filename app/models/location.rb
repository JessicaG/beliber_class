class Location < ActiveRecord::Base
  validates :state, :country, presence: true
  validates :city, presence: true, uniqueness: true
  has_many :fans

  def beliebe
    "#{city} Beliebers"
  end

end
