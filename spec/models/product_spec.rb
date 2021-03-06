require 'rails_helper'

describe Product do

  context "when the product has comments" do
    
  end

  context "create a user" do
    #let(:user) { User.create!(first_name: "John", last_name: "Wick", email: "johnwick041298@gmail.com", encrypted_password: "youkilledmydog")}
  end

  before do
    #let(:product) { Product.create!(name: "munchie") }
    @product = Product.create(name: "munchie")
    @user = User.create!(first_name: "John", last_name: "Wick", email: "johnwick041298@gmail.com", password: "youkilledmydog", password_confirmation: "youkilledmydog")
    @product.comments.create!(rating: 1, user_id: @user.id, body: "Awful munchie!")
    @product.comments.create!(rating: 3, user_id: @user.id, body: "Ok munchie!")
    @product.comments.create!(rating: 5, user_id: @user.id, body: "Great munchie!")
  end

  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq 3
  end

  context "is not valid without a name" do
  	let(:product) { Product.new(name: " ") }
  end

  it "expecting invalid" do
  	expect(Product.new(description: "Nice bike")).not_to be_valid
  end

end