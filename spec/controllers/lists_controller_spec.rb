require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let(:my_user) { User.create!(email: "user@makealist.com", password: "password") }
  let(:my_list) { List.create!(name: "List Title", description: "This is a list of things.", private: false) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns [my_list] to @lists" do
      get :index
      expect(assigns(:lists)).to eq([my_list])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #new" do
    before :each do 
      sign_in my_user
    end
    
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template(:new)
    end
    
    it "instantiates @list" do
      get :new
      expect(assigns(:list)).not_to be_nil
    end
  end
  
  describe "POST create" do
    before :each do 
      sign_in my_user
    end
    
    it "increases the number of List by 1" do
      expect{ post :create, params: { list: { name: RandomData.random_name, description: RandomData.random_paragraph, private: [true, false].sample } } }.to change(List, :count).by(1)
    end
    
    it "assigns the new list to @list" do
      post :create, params: { list: { name: RandomData.random_name, description: RandomData.random_paragraph, private: [true, false].sample } }
      expect(assigns(:list)).to eq(List.last)
    end
    
    it "redirects to the new list" do
      post :create, params: { list: { name: RandomData.random_name, description: RandomData.random_paragraph, private: [true, false].sample } }
      expect(response).to redirect_to(List.last)
    end
  end

end
