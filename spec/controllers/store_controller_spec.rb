RSpec.describe StoreController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #index" do
    let(:menus) { create_list(:menus, 2) }
    before { log_in(user) }
    before { get :index }

    it "populates an array of all menus" do
      expect(assigns(:menus)).to match_array(menus)
    end

    it "renders index view" do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:menu) { create(:menu) }

    before { log_in(user) }
    before { get :show, params: { id: menu } }

    it 'assigns request menu to @menu' do
      expect(assigns(:menu)).to eq menu
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end
