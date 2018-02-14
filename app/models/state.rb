class State < ApplicationRecord
  belongs_to :country
  validates :country_id, :name, presence: true
end
