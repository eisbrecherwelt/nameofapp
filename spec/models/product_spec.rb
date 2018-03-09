require 'rails_helper'

describe Product do
  
  context "when the product has comments" do
    let(:product) { Product.create!(name: "cheetos") }

    it "should return the product" do
      expect(@product.name).to eq "cheetos"
    end
  end

  context "create a user" do
    let(:user) { User.create!(first_name: "John", last_name: "Wick", email: "johnwick041298@gmail.com", encrypted_password: "youkilledmydog")}

    it "should return the user" do
      expect(@user.first_name).to eq "John"
    end
  end

  before do
    @product.comments.create!(rating: 1, user: user, body: "Awful bike!")
    @product.comments.create!(rating: 3, user: user, body: "Ok bike!")
    @product.comments.create!(rating: 5, user: user, body: "Great bike!")
  end

  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq 3
  end
end