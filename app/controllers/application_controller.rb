class ApplicationController < ActionController::Base
  before_action :set_cards
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @cards = Card.all
  end

  def set_cards
    @cards = Card.all
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end    


end
