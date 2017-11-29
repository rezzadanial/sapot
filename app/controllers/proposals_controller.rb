class ProposalsController < ApplicationController

  def create
    @gig = Gig.find(params[:gig_id])
    @proposal = @gig.proposals.create(proposal_params)
    @proposal.update(user_id: current_user.id)
    redirect_to @proposal.gig
  end

  private
    def proposal_params
      params.require(:proposal).permit(:bid, :description)
    end
end
