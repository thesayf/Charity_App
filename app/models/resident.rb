class Resident < User
  has_many :subscriptions
  has_many :projects, through: :subscriptions
end
