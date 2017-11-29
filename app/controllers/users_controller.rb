class UsersController < ApplicationController

  def profile
  end
  
  def edit_profile
    if params[:profile].present?
      current_user.update(avatar: params[:profile][:avatar]) if params[:profile][:avatar].present?
      current_user.update(about: params[:profile][:about]) if params[:profile][:about].present?
    end
    if params[:education].present?
      if !params[:education][:id].present?
        current_user.educations.create(institure_name: params[:education][:institure_name], description: params[:education][:description])
      else
        Education.find(params[:education][:id]).update(institure_name: params[:education][:institure_name], description: params[:education][:description])
      end
    end
    if params[:user_skills].present?
      skils_array = params[:user_skills][:skill].split(",")
      current_user.user_skills.destroy_all
      skils_array.each do |user_skill|
        current_user.user_skills.create(skill: user_skill)
      end
    end
    redirect_to profile_users_path, notice: "profile updated"
  end
end