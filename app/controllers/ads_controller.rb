class AdsController < ApplicationController
  before_action :set_ad, only: %i[show update destroy]
  # before_action :permit_params, only: %i[create update]

  def index
    @ads = Ad.all
    render json: @ads, status: :ok
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
    render json: @ad, status: :ok
  end

  def destroy
    @ad.destroy
    head :no_content
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
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
    ]
  end
end
