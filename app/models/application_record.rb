class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
end
