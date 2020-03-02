module AttractionsHelper
    
    def prompt
        if admin?(current_user)
            "Show"
        else
            "Go on"
        end
    end

end
