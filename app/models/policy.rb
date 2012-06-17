class Policy < ActiveRecord::Base
  module Product
    FIRE = "Fire"
    ENG = "Engg"
    HEALTH = "Health"
    LIABILITY = "Liability"
    MOTOR = "Motor"
    MISC = "Misc"
    MARINE = "Marine"

    def self.all
      [FIRE, ENG, HEALTH, LIABILITY, MOTOR, MISC, MARINE]
    end
  end

  belongs_to :user
  has_many :claims, :dependent => :destroy

  validates :user, :number, :insurer, :premium, :start, :end, :presence => true
  validates :product_type, :inclusion => {:in => Product.all}
  validates :number, :uniqueness => true

  scope :pending_renewal, lambda {where("end < ? AND end > ?",Date.today,2.months.from_now.to_date)}
end
