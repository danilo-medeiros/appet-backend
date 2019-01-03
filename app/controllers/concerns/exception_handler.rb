module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      head :not_found
    end

    rescue_from JWT::VerificationError do |e|
      head :unauthorized
    end

    rescue_from JWT::DecodeError do |e|
      head :unauthorized
    end
  end
end