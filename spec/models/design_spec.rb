require 'spec_helper'

describe Design do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @design = user.designs.build(name: "Test design") }
  
  subject { @design }
  
  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  
  it { should be_valid }
  
  describe "when user_id is not present" do
    before { @design.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "with blank name" do
    before { @design.name = " " }
    it { should_not be_valid }
  end
  
  describe "with name that is too long" do
    before { @design.name = "a" * 51 }
    it { should_not be_valid }
  end
end
