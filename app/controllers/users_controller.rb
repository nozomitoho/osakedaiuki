class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
        
    end

    def following
        #@userがフォローしているユーザー
        @user  = User.find(params[:id])
        @users = @user.following
        #render 'show_follow'
        render '_follow_form'
    end

    def followers
        #@userをフォローしているユーザー
        @user  = User.find(params[:id])
        @users = @user.followers
        # render 'show_follower'
        render '_follow_form'
    end
end
