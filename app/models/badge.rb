class Badge < ApplicationRecord

  BADGE_PICTURE = %w(flame heart mortar-board hubot squirrel ruby)

  belongs_to :rule, class_name: 'Rule'

  has_many :badges_rules
  has_many :rules, through: :badges_rules, dependent: :destroy
  has_many :badges_users
  has_many :users, through: :badges_users, dependent: :destroy

end
