# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  has_many :questions, dependent: :destroy
  has_many :passed_tests
  has_many :users, through: :passed_tests

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates :level, uniqueness: true

  scope :easy, -> { pp where(level: 0..1) }
  scope :medium, -> { pp where(level: 2..4) }
  scope :hard, -> { pp where(level: 5..Float::INFINITY) }
  scope :tests_by_category, lambda { |category|
                              joins('JOIN categories ON tests.category_id = categories.id')
                                .where(categories: { title: category })
                                .order(title: :DESC)
                            }
end
