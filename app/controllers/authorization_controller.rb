class AuthorizationController < ApplicationController
#  before_action :set_authorization, only: [:show, :update, :delete]

  # POST /authorizations
  def create
    @authorization = Authorization.new(authorization_params)

    if @authorization.save
      render json: @authorization, status: :created
    else
      render json: @authorization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authorizations/1
  def delete
    @authorization.destroy
    render json: {deleted: true}
  end

  private
    # Only allow a trusted parameter "white list" through.
    def authorization_params
      params.require(:authorization).permit(:invoice_id, :secret_key)
    end
end
