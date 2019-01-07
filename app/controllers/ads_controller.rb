class AdsController < ApplicationController
  before_action :set_ad, only: %i[show update destroy picture]
  # before_action :permit_params, only: %i[create update]

  def index
    @q = Ad.ransack(params[:q])
    @q.sorts = ['created_at desc']
    @ads = @q.result(distinct: true).paginate(page: params[:page], per_page: 20)
    render json: @ads, status: :ok
  end

  def create
    @ad = Ad.create!(permit_params)
    render json: @ad, status: :created
  end

  def picture
    @ad.picture.attach(params[:file])
    if @ad.picture.attached?
      render json: @ad, status: :ok
    else
      head :not_modified
    end
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

  def paginate(items)
    return {
      records: items,
      pagination: {
        current_page: items.current_page,
        count: items.count
      }
    }
  end

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

  def picture_params
    params.permit(:file)
  end
end
