class AuthorizationController < ApplicationController
  skip_before_action :authenticate_request!, only: %i[create delete]

  # POST /authorizations
  def create
    if params[:invoice_id] == '0211' && params[:secret_key] == '4891'
      render json: payload, status: :ok
    else
      render json: {error: 'Invalid invoice or secret key'}, status: 401
    end
  end

  # DELETE /authorizations/1
  def delete
    render json: [], status: 306
  end

  private

  def payload(invoice=nil)
    payload = {
      exp: 3.hours.from_now.to_i,
      data: {
        first_name: 'Carlos',
        last_name: 'Danger',
        invoice: '1234'
      }
    }
    {auth_token: JWT.encode(payload, ENV['SUPER_SECRET_KEY_BASE']) }
  end
end
