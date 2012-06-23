class PoliciesController < ApplicationController
  def index
    @tab = TabConstants::POLICIES
    @policies = current_user.policies.order("end_date")    
    @filter = params[:filter].presence
  end

  def health
    @tab = TabConstants::HEALTH
    @type = params[:type]
  end
end
