require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:my_list) { List.create!(name:  RandomData.random_name, description: RandomData.random_paragraph, private: false) }
  let(:my_product) { my_list.products.create!(name: RandomData.random_name, description: RandomData.random_paragraph, store1_name: RandomData.random_name, store1_link: 'http://brandoncaples.com/', store1_price: RandomData.random_price, store2_name: RandomData.random_name, store2_link: 'http://brandoncaples.com/', store2_price: RandomData.random_price, position: RandomData.random_rank) }

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { list_id: my_list.id, id: my_product.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, params: { list_id: my_list.id, id: my_product.id }
      expect(response).to render_template(:show)
    end
    
    it "assigns my_product to @product" do
      get :show, params: { list_id: my_list.id, id: my_product.id }
      expect(assigns(:product)).to eq(my_product)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { list_id: my_list.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new, params: { list_id: my_list.id }
      expect(response).to render_template(:new)
    end
    
    it "initializes @product" do
      get :new, params: { list_id: my_list.id }
      expect(assigns(:product)).not_to be_nil
    end
  end
  
  describe "POST create" do
    it "assigns the first product to position 0" do
      products = my_list.products.count
      post :create, params: { product_id: my_product.id }
      expect(my_list.products.count).to eq(products + 1)
    end
    
    it "increases the number of Product by 1" do
      expect{ post :create, params: { list_id: my_list.id, product: { name: RandomData.random_name, description: RandomData.random_paragraph, store1_name: RandomData.random_name, store1_link: 'http://brandoncaples.com/', store1_price: RandomData.random_price, store2_name: RandomData.random_name, store2_link: 'http://brandoncaples.com/', store2_price: RandomData.random_price, position: RandomData.random_rank } } }.to change(Product,:count).by(1)
    end
    
    it "assigns the new product to @product" do
      post :create, params: { list_id: my_list.id, product: { name: RandomData.random_name, description: RandomData.random_paragraph, store1_name: RandomData.random_name, store1_link: 'http://brandoncaples.com/', store1_price: RandomData.random_price, store2_name: RandomData.random_name, store2_link: 'http://brandoncaples.com/', store2_price: RandomData.random_price, position: RandomData.random_rank } }
      expect(assigns(:product)).to eq(Product.last)
    end
    
    it "assigns the next sequential position to the product" do
      
    end
    
    it "redirects to the new product" do
      post :create, params: { list_id: my_list.id, product: { name: RandomData.random_name, description: RandomData.random_paragraph, store1_name: RandomData.random_name, store1_link: 'http://brandoncaples.com/', store1_price: RandomData.random_price, store2_name: RandomData.random_name, store2_link: 'http://brandoncaples.com/', store2_price: RandomData.random_price, position: RandomData.random_rank } }
      expect(response).to redirect_to([my_list, Product.last])
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { list_id: my_list.id, id: my_product.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, params: { list_id: my_list.id, id: my_product.id }
      expect(response).to render_template(:edit)
    end
    
    it "assigns product to be updated to @product" do
      get :edit, params: { list_id: my_list.id, id: my_product.id }
      product_instance = assigns(:product)
      
      expect(product_instance.id).to eq(my_product.id)
      expect(product_instance.name).to eq(my_product.name)
      expect(product_instance.description).to eq(my_product.description)
      expect(product_instance.store1_name).to eq(my_product.store1_name)
      expect(product_instance.store1_link).to eq(my_product.store1_link)
      expect(product_instance.store1_price).to eq(my_product.store1_price)
      expect(product_instance.store2_name).to eq(my_product.store2_name)
      expect(product_instance.store2_link).to eq(my_product.store2_link)
      expect(product_instance.store2_price).to eq(my_product.store2_price)
      expect(product_instance.position).to eq(my_product.position)
    end
  end
  
  describe "PUT update" do
    it "updates product with expected attributes" do
      new_name = RandomData.random_name
      new_description = RandomData.random_paragraph
      new_store1_name = RandomData.random_name
      new_store1_link = 'http://brandoncaples.com/'
      new_store1_price = RandomData.random_price
      new_store2_name = RandomData.random_name
      new_store2_link = 'http://brandoncaples.com/'
      new_store2_price = RandomData.random_price,
      new_position = RandomData.random_rank
      
      put :update, params: { list_id: my_list.id, id: my_product.id, product: { name: RandomData.random_name, description: RandomData.random_paragraph, store1_name: RandomData.random_name, store1_link: 'http://brandoncaples.com/', store1_price: RandomData.random_price, store2_name: RandomData.random_name, store2_link: 'http://brandoncaples.com/', store2_price: RandomData.random_price, position: RandomData.random_rank } }
      
      updated_product = assigns(:product)
      expect(updated_product.id).to eq(my_product.id)
      expect(updated_product.name).to eq(new_name)
      expect(updated_product.description).to eq(new_description)
      expect(updated_product.store1_name).to eq(new_store1_name)
      expect(updated_product.store1_link).to eq(new_store1_link)
      expect(product_instance.store1_price).to eq(my_product.store1_price)
      expect(updated_product.store2_name).to eq(new_store2_name)
      expect(updated_product.store2_link).to eq(new_store2_link)
      expect(product_instance.store2_price).to eq(my_product.store2_price)
      expect(product_instance.position).to eq(my_product.position)
    end
    
    it "redirects to the updated product" do
      new_name = RandomData.random_name
      new_description = RandomData.random_paragraph
      new_store1_name = RandomData.random_name
      new_store1_link = 'http://brandoncaples.com/'
      new_store1_price = RandomData.random_price
      new_store2_name = RandomData.random_name
      new_store2_link = 'http://brandoncaples.com/'
      new_store2_price = RandomData.random_price
      new_position = RandomData.random_rank
      
      put :update, params: { list_id: my_list.id, id: my_product.id, product: { name: RandomData.random_name, description: RandomData.random_paragraph, store1_name: RandomData.random_name, store1_link: 'http://brandoncaples.com/', store1_price: RandomData.random_price, store2_name: RandomData.random_name, store2_link: 'http://brandoncaples.com/', store2_price: RandomData.random_price, order: RandomData.random_rank } }
      expect(response).to redirect_to([my_list, my_product])
    end
  end
  
  describe "DELETE destroy" do
    it "deletes the product" do
      delete :destroy, params: { list_id: my_list.id, id: my_product.id }
      count = Product.where({ id: my_product.id }).size
      expect(count).to eq(0)
    end
    
    it "redirects to list show" do
      delete :destroy, params: { list_id: my_list.id, id: my_product.id }
      expect(response).to redirect_to(my_list)
    end
  end
end
