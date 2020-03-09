module StoreHelper
  def menu_made_up?(menu)
    menu.products.present? || !current_user.admin
  end
end
