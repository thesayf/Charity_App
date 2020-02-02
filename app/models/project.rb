class Project < ApplicationRecord
  belongs_to :charity
  has_many :subscriptions, dependent: :delete_all
  has_many :residents, through: :subscriptions
  has_many :sessions, dependent: :delete_all
end
