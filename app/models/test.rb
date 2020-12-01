class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user, class_name: 'Author'

  has_many :questions, dependent: :destroy
  has_many :users, through: :passed_tests

  def self.tests_by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category })
      .order(title: :DESC)
  end
end
