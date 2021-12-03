# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'
FactoryBot.find_definitions
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  config.include FactoryBot::Syntax::Methods
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('<movie_api>') { ENV['movie_api'] }
  config.default_cassette_options = { re_record_interval: 7.days }
  config.configure_rspec_metadata!
end
def movie_data
  {:adult=>false,
 :backdrop_path=>"/ELsTifJ2lu4vsMhoHeZ5EnncHw.jpg",
 :belongs_to_collection=>nil,
 :budget=>70000000,
 :genres=>[{:id=>35, :name=>"Comedy"}, {:id=>14, :name=>"Fantasy"}, {:id=>878, :name=>"Science Fiction"}],
 :homepage=>"https://www.warnerbros.com/movies/mars-attacks/",
 :id=>75,
 :imdb_id=>"tt0116996",
 :original_language=>"en",
 :original_title=>"Mars Attacks!",
 :overview=>
  "'We come in peace' is not what those green men from Mars mean when they invade our planet, armed with irresistible weapons and a cruel sense of humor.  This star studded cast must play victim to the alien’s fun and games in this comedy homage to science fiction films of the '50s and '60s.",
 :popularity=>15.809,
 :poster_path=>"/hll4O5vSAfnZDb6JbnP06GPtz7b.jpg",
 :production_companies=>
  [{:id=>8601, :logo_path=>nil, :name=>"Tim Burton Productions", :origin_country=>""},
   {:id=>174, :logo_path=>"/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png", :name=>"Warner Bros. Pictures", :origin_country=>"US"}],
 :production_countries=>[{:iso_3166_1=>"US", :name=>"United States of America"}],
 :release_date=>"1996-12-12",
 :revenue=>101371017,
 :runtime=>106,
 :spoken_languages=>
  [{:english_name=>"English", :iso_639_1=>"en", :name=>"English"}, {:english_name=>"French", :iso_639_1=>"fr", :name=>"Français"}],
 :status=>"Released",
 :tagline=>"Nice planet. We'll take it!",
 :title=>"Mars Attacks!",
 :video=>false,
 :vote_average=>6.4,
 :vote_count=>4280}
end
def cast_data
  {:adult=>false,
 :gender=>2,
 :id=>514,
 :known_for_department=>"Acting",
 :name=>"Jack Nicholson",
 :original_name=>"Jack Nicholson",
 :popularity=>16.27,
 :profile_path=>"/6h12pZsgj3WWjMtykUgfLkLEBWz.jpg",
 :cast_id=>6,
 :character=>"President James Dale / Art Land",
 :credit_id=>"52fe4214c3a36847f8002301",
 :order=>0}
end
def review_data
  {:author=>"Kamurai",
 :author_details=>{:name=>"Kamurai", :username=>"Kamurai", :avatar_path=>"/sKeC7qZLAKreuwxH4x6U3mN7Aa8.jpg", :rating=>6.0},
 :content=>
  "Good watch, could watch again, but it's hard to honestly recommend.\r\n\r\nThis is one of those movies that is good because it is bad, whether or not that is done on purpose, for the purposes of parody.  Otherwise it's just a good old jump in \"The Way Back Machine\" to see a litany of cameos or cheap parts by almost anyone who was famous in the mid-1990s.  Though I do feel like most of the actors I liked were essentially wasted, but it is possible that was by design so the Martians could keep the focus for the majority of the movie.\r\n\r\nRethinking on the movie almost makes me want a modernization, it has so many little quirks and nuances that really brings it to a special experience.  Even if you think it looks terrible, throw this on your queque and slot it in for a Bad Movie Night.",
 :created_at=>"2021-02-23T16:52:21.762Z",
 :id=>"603532c597eab4003fd23f18",
 :updated_at=>"2021-06-23T15:58:52.206Z",
 :url=>"https://www.themoviedb.org/review/603532c597eab4003fd23f18"}
end
