class User < ApplicationRecord

	def tests_user(numb)
		Test.where(level: numb)
	end
end
