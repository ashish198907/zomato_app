class Restaurant < ActiveRecord::Base
  attr_accessible :address, :name, :phone

  has_many :reviews, :dependent => :destroy

  def avg_rating
    self.reviews.present? ? (self.reviews.map(&:rating).sum.to_f/self.reviews.count.to_f).round : 0
  end
end
