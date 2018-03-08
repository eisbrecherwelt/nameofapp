require 'rails_helper'

describe Product do
  context "When the product has comments" do
  	let(:product) { Product.create!(name: "munchies") }
  end

  context "Something about a user" do
    let(:user) { User.create!(first_name: "John", last_name: "Wick", email: "johnwick041298@gmail.com", encrypted_password: "youkilledmydog")}
  end

  before do
    Product.comments.create!(rating: 1, user: user, body: "Awful munchie!")
    Product.comments.create!(rating: 3, user: user, body: "Ok munchie!")
    Product.comments.create!(rating: 5, user: user, body: "Great munchie!")
  end

  it "returns the average rating of all comments" do
    expect(Product.average_rating).to eq 3
  end
end