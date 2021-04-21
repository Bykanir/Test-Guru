# frozen_string_literal: true

class Question < ApplicationRecord

  belongs_to :test

  validates :body, presence: true

  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy
  
end
