class ApplicationController < Jets::Controller::Base

  before_action :authenticate_request!

  protected

  def authenticate_request!
    unless http_token
      render json: { errors: 'Not Authenticated' },  status: :unauthorized
    end
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { errors: 'Verification/decode error' }, status: :unauthorized
  end

  def http_token
    @http_token ||= if headers['authorization'].present?
      headers['authorization'].split(' ').last
    end
  end

end
