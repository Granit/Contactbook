# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Simpleblog::Application.initialize!


#require 'active_support'
#ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(:my_special_format => '%Y/%m/%d %H:%M:%S')

#script/plugin install git://github.com/technoweenie/restful-authentication.git

#http://railscasts.com/episodes/67-restful-authentication
#script/plugin install git://github.com/sbecker/asset_packager.git

#generate the /config/asset_packages.yml 
# add files to public/javascript
#rake asset:packager:build_all

#sudo gem install cucumber-rails
#sudo gem install webrat
