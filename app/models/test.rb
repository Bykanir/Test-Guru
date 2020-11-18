class Test < ApplicationRecord
	
	def self.categories_choice(categor)
		Test.joins('JOIN categories ON tests.category_id = categories.id')
			.where('categories.title = ?', categor)
			.order(title: :DESC)
	end
end
