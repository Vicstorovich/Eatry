feature "I can see a menu list of items with prices." , %q{
  As a user, when I click on a day of the week
  (today or days in the past)
  I see a menu list of items with prices.
} do
  given(:user) { create(:user) }
  # не справился
end
