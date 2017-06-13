class StoreController < ApplicationController
  include CurrentCart
  include SessionCounter
  skip_before_action :authorize
  before_action :set_cart
  before_action :counter_increment, only: [:index]

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
  end
end
