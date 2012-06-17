class ClaimsController < ApplicationController

  def index
    @tab = TabConstants::CLAIMS
    @paid = (params[:paid] == "true")
    @claims = @paid ? current_user.claims.paid : current_user.claims.not_paid
    @claims = @claims.order("loss_date")
  end
end
