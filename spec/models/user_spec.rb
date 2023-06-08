require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without a name" do
    user = User.new
    expect(user).to_not be_valid
  end

  it "is valid with a valid name" do
    user = User.new(name: "John Doe")
    expect(user).to be_valid
  end

  it "has a non-negative post counter" do
    user = User.new(name: "Jane Smith", post_counter: -1)
    expect(user).to_not be_valid
  end

end
