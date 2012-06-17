class PoliciesController < ApplicationController
  def index
    @tab = TabConstants::POLICIES
    @policies = current_user.policies.order("end")    
  end
end