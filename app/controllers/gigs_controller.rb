class GigsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search, :show]

  def index
    if !params[:skill_jobs]
      @gigs = Gig.all.order_list(params[:sort_by]).page(params[:page]).per(12)
    else
      @gigs = Gig.joins(:skills).where(skills: {name: current_user.user_skills.pluck(:skill)}).order_list(params[:sort_by]).page(params[:page]).per(12)
    end
    @users = User.all
  end

  def show
    @gig = Gig.find(params[:id])
    @proposals = @gig.proposals.order("created_at DESC").joins(:user)
    @awarded_proposal = Proposal.where(id: @gig.awarded_proposal).first
    #@awarded_proposal = @gig.proposals.order("created_at DESC").joins(:users).joins(:gigs).where(gig_id: params[:id])
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(gig_params)
    @gig.user = current_user
    if @gig.save
      User.all.each do |user|
        NewGigMailer.send_mail(user).deliver
      end
      redirect_to @gig
    else
      flash[:error] = @gig.errors.full_messages.to_sentence
      render "new"
    end
  end

  def edit
    @gig = Gig.find(params[:id])
    if current_user != @gig.user
      flash[:error] = "You are not the owner of this gig"
      redirect_to @gig
    end
  end

  def update
    @gig = Gig.find(params[:id])
    if current_user == @gig.user
      @gig.update(gig_params)
    else
      flash[:error] = "You are not the owner of this gig"
    end
    redirect_to @gig

  end

  def destroy
    @gig = Gig.find(params[:id])
    if current_user == @gig.user
      @gig.destroy
    else
      flash[:error] = "You are not the owner of this gig"
    end
    redirect_to :mygigs
  end

  def search
    if params[:category].blank? && params[:search].blank?
      @gigs = Gig.all.order("created_at desc").page(params[:page]).per(12)
    else
      @gigs = Gig.search(params).page(params[:page]).per(12)
    end
  end

  def mygigs
    @gigs = Gig.where(user_id: current_user).order("created_at desc")
  end

  private
    def gig_params
      params.require(:gig).permit(:name, :location, :description, :budget, :category_id, :skill_list, :awarded_proposal)
    end
end
