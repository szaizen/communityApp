class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :portfolios, dependent: :destroy
  has_many :articles
  has_many :comments

  before_create :build_default_profile

	private
  	def build_default_profile
      build_profile
      true
  	end

end
