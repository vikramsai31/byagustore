# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Byagustore::Application.initialize!
config.gem "activemerchant", :lib => "active_merchants"
