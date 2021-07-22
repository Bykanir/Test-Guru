class Badge < ApplicationRecord

  belongs_to :rule, class_name: 'Rule'

  has_many :users, class_name: 'User', foreign_key: 'user_id', dependent: :destroy
  has_many :badges_rules
  has_many :rules, through: :badges_rules, dependent: :destroy
  has_many :badges_users
  has_many :users, through: :badges_users, dependent: :destroy

  def self.badge_picture
    %w(flame heart mortar-board hubot squirrel ruby)
  end

end
