require 'rails_helper'

RSpec.describe 'Travels controller', type: :request do
  describe "GET #index" do
    it "renders travels_path view with an array of travels" do
      user = create(:user)
      sign_in user
      get travels_path
      assert_response :success
    end
  end
end
