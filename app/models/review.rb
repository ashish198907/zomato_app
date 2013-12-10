class Review < ActiveRecord::Base
  attr_accessible :content, :rating, :restaurant_id, :user_id

  belongs_to :restaurant
  belongs_to :user
end
