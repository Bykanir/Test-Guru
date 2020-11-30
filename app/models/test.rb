class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user_authors
  belongs_to :passed_tests

  has_many :questions, dependent: :destroy

  def self.tests_by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category })
      .order(title: :DESC)
  end
end
