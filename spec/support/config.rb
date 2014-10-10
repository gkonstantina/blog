RSpec.configure do |config|
	# ## Mock Framework
	#
	# If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
	#
	# config.mock_with :mocha
	# config.mock_with :flexmock
	# config.mock_with :rr

	# Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
	# config.fixture_path = "#{::Rails.root}/spec/fixtures"

	# If you're not using ActiveRecord, or you'd prefer not to run each of your
	# examples within a transaction, remove the following line or assign false
	# instead of true.
	# config.use_transactional_fixtures = true

	# If true, the base class of anonymous controllers will be inferred
	# automatically. This will be the default behavior in future versions of
	# rspec-rails.
	config.infer_base_class_for_anonymous_controllers = false

	# Run specs in random order to surface order dependencies. If you find an
	# order dependency and want to debug it, you can fix the order by providing
	# the seed, which is printed after each run.
	#     --seed 1234
	config.order = "random"

	config.include FactoryGirl::Syntax::Methods

	config.before(:each) do
		# Mongoid::Sessions.default.collections.select {|c| c.name !~ /system/ }.each(&:drop)
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
	end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include Devise::TestHelpers, :type => :controller
end
