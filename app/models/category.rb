class Category < ActiveRecord::Base
	has_many :arts, dependent: :destroy
end
