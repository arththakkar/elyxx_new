class Category < ActiveRecord::Base
	has_many :arts, dependent: :destroy

	validates :name, presence: true
end
