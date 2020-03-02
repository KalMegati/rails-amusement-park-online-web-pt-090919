module SessionsHelper

    def current_user
        User.find(session[:user_id])
    end

    def admin?(user)
        true if user.admin
    end

end
