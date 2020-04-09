class InvoicesController < ApplicationController

  def show
    render json: {data: 'never stop partying!!'}, status: :ok
  end

end
