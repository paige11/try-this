class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  has_many :questions
  has_many :solutions, foreign_key: :contributor_id
  has_many :votes
  validates_uniqueness_of :username
  include ApplicationHelper

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name ADD LATER - FOR FB USERS TAKE NAME, OTHERWISE UNAVAIL?
    end
  end

  def question_count
    questions.count
  end

  def solution_count
    solutions.count
  end

  def username_or
    username || "User"
  end

  def valid_password?(password)
    !provider.nil? || super(password)
  end

end
