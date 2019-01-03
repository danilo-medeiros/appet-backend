class AdsController < ApplicationController
  before_action :set_ad, only: %i[show update destroy]
  # before_action :permit_params, only: %i[create update]

  def index
    @q = Ad.ransack(params[:q])
    @ads = @q.result(distinct: true).paginate(page: params[:page], per_page: 20)
    render 'ads/index'
  end

  def create
    @ad = Ad.create!(permit_params)
    render json: @ad, status: :created
  end

  def update
    @ad.update(permit_params)
    render json: @ad, status: :ok
  end

  def show
    render 'ads/show'
  end

  def destroy
    @ad.destroy
    head :no_content
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def permit_params
    params.permit(*permitted_params)
  end

  def permitted_params
    %i[
      title
      pet_name
      pet_type
      size
      neighborhood
      city
      state
      description
      aprox_age
      weight
      user_id
    ]
  end
end
