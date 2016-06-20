require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ProductsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Product. As you add validations to Product, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      name: "hola mundo",
      pricing: 1.0,
      user: FactoryGirl.create(:user) 
    }
  }

  let(:invalid_attributes) {
    {
      name: "",
      pricing: 0    
    }
  }

  describe "GET #index" do
    it "assigns all products as @products" do
      product = Product.create! valid_attributes
      get :index, {}
      expect(assigns(:products)).to eq([product])
    end
  end

  describe "GET #show" do
    it "assigns the requested product as @product" do
      product = Product.create! valid_attributes
      get :show, {:id => product.to_param}
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "GET #new" do
    login_user
    it "assigns a new product as @product" do
      get :new, {}
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe "GET #edit" do
    login_user
    it "assigns the requested product as @product" do
      product = Product.create! valid_attributes
      get :edit, {:id => product.to_param}
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "POST #create" do
    
    context "with valid params" do
      login_user
      it "creates a new Product" do
        expect {
          post :create, {:product => valid_attributes}
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, {:product => valid_attributes}
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it "redirects to the created product" do
        post :create, {:product => valid_attributes}
        expect(response).to redirect_to(Product.last)
      end
    end

    context "with invalid params" do
      login_user
      it "assigns a newly created but unsaved product as @product" do
        post :create, {:product => invalid_attributes}
        expect(assigns(:product)).to be_a_new(Product)
      end

      it "re-renders the 'new' template" do
        post :create, {:product => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
    context "without session" do
      it "redirects to the login page" do
        post :create, {:product => valid_attributes}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "PUT #update" do
    login_user
    context "with valid params" do
      let(:new_attributes) {
        {
          name:"Actualizado"
        }
      }

      it "updates the requested product" do
        product = Product.create! valid_attributes
        put :update, {:id => product.to_param, :product => new_attributes}
        product.reload
        expect(product.name).to eq("Actualizado")
      end

      it "assigns the requested product as @product" do
        product = Product.create! valid_attributes
        put :update, {:id => product.to_param, :product => valid_attributes}
        expect(assigns(:product)).to eq(product)
      end

      it "redirects to the product" do
        product = Product.create! valid_attributes
        put :update, {:id => product.to_param, :product => valid_attributes}
        expect(response).to redirect_to(product)
      end
    end

    context "with invalid params" do
      it "assigns the product as @product" do
        product = Product.create! valid_attributes
        put :update, {:id => product.to_param, :product => invalid_attributes}
        expect(assigns(:product)).to eq(product)
      end

      it "re-renders the 'edit' template" do
        product = Product.create! valid_attributes
        put :update, {:id => product.to_param, :product => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    login_user
    it "destroys the requested product" do
      product = Product.create! valid_attributes
      expect {
        delete :destroy, {:id => product.to_param}
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = Product.create! valid_attributes
      delete :destroy, {:id => product.to_param}
      expect(response).to redirect_to(products_url)
    end
  end

end
