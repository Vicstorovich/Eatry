RSpec.configure do |config|
  # If you're not using ActiveRecord, or you'd prefer not to run
  # each of your examples within a transaction, remove the following
  # line or assign false instead of true.
  config.use_transactional_fixtures = false

  # Clean up and initialize database before
  # running test exmaples
  config.before(:suite) do
    # Truncate database to clean up garbage from
    # interrupted or badly written examples
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    begin
      DatabaseCleaner.start

    ensure
      DatabaseCleaner.clean
    end
    # Seed dataase. Use it only for essential
    # to run application data.
    load "#{Rails.root}/db/seeds.rb"
  end

  config.around(:each) do |example|
    # Use really fast transaction strategy for all
    # examples except `js: true` capybara specs
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction

    # Start transaction
    DatabaseCleaner.cleaning do
      # Run example
      example.run
    end

    load "#{Rails.root}/db/seeds.rb" if example.metadata[:js]

    # Clear session data
    Capybara.reset_sessions!
  end
end
