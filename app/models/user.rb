class User < ActiveRecord::Base
  acts_as_authentic

  has_many :policies, :dependent => :destroy
  has_many :claims, :dependent => :destroy


  validates :name, :presence => true
end