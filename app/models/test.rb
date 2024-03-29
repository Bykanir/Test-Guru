# frozen_string_literal: true

class Test < ApplicationRecord
  
  TIMER = [1, 5, 10, 15, 20]

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages, dependent: :destroy

  validates :title, presence: true,
            uniqueness: { scope: :level, message: 'something is wrong with the level' }
  validates :level, numericality: { greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def self.tests_by_category(category)
    category(title: category).order(title: :DESC)
  end
end
