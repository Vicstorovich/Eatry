RSpec.describe OrdersController, type: :controller do
    let(:user) { create(:user) }
     before { log_in(user) }

   describe 'GET #new' do
    before { get :new }
    it "assigns a new @order" do
      expect(assigns(:order)).to be_a_new(Order)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:cart) { create(:cart) }
    let(:line_item_1) { create(:line_item, cart: cart) }
    let(:line_item_2) { create(:line_item, cart: cart) }

    let(:order) { Order.new }

    context 'with valid attributes' do
     let(:action) { post :create, params: { order: attributes_for(:order) } }

      it 'saves a new order in the database' do
        expect { action }.to change(Order, :count).by(1)
      end
      it 'renders to home page' do
        action
        expect(response).to redirect_to store_index_path
      end

      it 'saves cart line_items to order' do
        action
        expect(assigns(:order).add_line_items_from_cart(cart)
          ).to match_array(order.line_items)
      end
    end

    context "with invalid attributes" do
      let(:action) { post :create, params: { order: attributes_for(:order, :invalid) } }

      it "does not save the order" do
        expect { action }.to_not change(Order, :count)
      end

      it "re-renders new view" do
        action
        expect(response).to render_template :new
      end
    end
  end
end
