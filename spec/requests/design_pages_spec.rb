require 'spec_helper'

describe "Design Pages" do
  
  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  describe "design creation" do
    before { visit new_design_path }
    
    let(:submit) { "Create a design"}
    
    describe "with invalid information" do
      
      it "should not create a design" do
        expect {click_button "Create" }.not_to change(Design, :count)
      end
      
      describe "error messages" do
        before { click_button "Create" }
        it { should have_content('error') }
      end
    end
    
    describe "with valid information" do
      
      before { fill_in 'design_name', with: "test"}
      it "should create a design" do
        expect { click_button "Create" }.to change(Design, :count).by(1)
      end
    end
  end
end
