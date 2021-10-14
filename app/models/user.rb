class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :news
  has_many :userrequests

  enum role: [:standard, :premium, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end
end
