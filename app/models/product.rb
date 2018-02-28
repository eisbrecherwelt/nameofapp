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
    ## perform a paginated query:
    @posts = Post.paginate(:page => params[:page])

    # or, use an explicit "per page" limit:
    Post.paginate(:page => params[:page], :per_page => 3)
  end

end
