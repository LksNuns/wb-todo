class Authenticable::AuthenticableController < ApplicationController
  before_action :authenticate_user!
end
