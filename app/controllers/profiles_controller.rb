class ProfilesController < ApplicationController
    def new
        #form where user can fill out their own profile.
        @user = User.find( params[:user.id] )
        @profile = @user.build_profile
    end
end