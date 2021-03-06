class Product < ApplicationRecord
  validates :name, presence: true

  has_many :comments

  def self.search(search_term)
    if Rails.env.production?
      Product.where("name ilike ?", "%#{search_term}%")
    elsif Rails.env.development?
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def show

  end

  def views
    $redis.get("product:#{id}") # this is equivalent to 'GET product:1'
  end

  def viewed!
    $redis.incr("product:#{id}") # Equivalent to 'INC product:1'
  end


end
