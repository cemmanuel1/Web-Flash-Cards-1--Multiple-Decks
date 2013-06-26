class Url < ActiveRecord::Base

  before_create :generate_short_address
  validates :address, format: {with: /^#{URI::regexp}$/, message: "Invalid URL: Enter Again"}

  belongs_to :user

  def generate_short_address
    self.short_address = SecureRandom.hex(5)
  end
end
