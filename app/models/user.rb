class User < ApplicationRecord
  has_many :products
  has_many :purchases
  has_one :profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def has_profile?
    profile.present?
  end

  def seller?
    self.role == "seller"
  end

  def buyer?
    self.role == "buyer"
  end

end
