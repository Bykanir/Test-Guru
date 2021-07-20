# frozen_string_literal: true

class User < ApplicationRecord

  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :badges_users
  has_many :badge, through: :badges_users, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :gists, dependent: :destroy


  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

  def passed_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test)
  end
  
end
