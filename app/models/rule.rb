class Rule < ApplicationRecord

  has_many :badges_rules
  has_many :badge, through: :badges_rules, dependent: :destroy

end
