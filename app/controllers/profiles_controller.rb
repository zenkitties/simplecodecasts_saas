class ProfilesController < ApplicationController
    def new
        #form where user can fill out their own profile.
        @user = User.find( params[:user_id] )
        @profile = Profile.new
    end
    
    def create
       @user = User.find( params[:user_id] )
       @profile =  @user.build_profile(profile_params)
       if @profile.save
           flash[:success] = "You Profile Has Been Updated!"
           redirect_to user_path( params[:user_id] )
       else
           flash[:danger] = "Oops! Something Went Wrong! Try again!"
           render action: :new
       end
    end
    
    def edit
        @user = User.find( params[:user_id] )
        @profile = @user.profile
    end
    
    private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
        end
end