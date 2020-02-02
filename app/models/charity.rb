class Charity < ApplicationRecord
  has_many :employees, dependent: :delete_all
  has_many :projects, dependent: :delete_all
  belongs_to :admin
end
