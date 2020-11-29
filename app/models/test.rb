class Test < ApplicationRecord
  has_many :questions
  has_and_belongs_to_many :users
  has_and_belongs_to_many :user_authors
  belongs_to :category
  
  def self.tests_by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category })
      .order(title: :DESC)
  end
end
