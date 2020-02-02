class Subscription < ApplicationRecord
  belongs_to :resident
  belongs_to :project
end
