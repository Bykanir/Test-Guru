class Rule < ApplicationRecord

  has_many :badges_rules
  has_many :badge, through: :badges_rules, dependent: :destroy
  has_many :badges, class_name: 'Badge', foreign_key: 'rule_id', dependent: :destroy

end
