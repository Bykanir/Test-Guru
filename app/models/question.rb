# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  validates :body, presence: true
  validates :counte_answers, numericality: { less_than_or_equal_to: 4 }

  has_many :answers, dependent: :destroy
end
