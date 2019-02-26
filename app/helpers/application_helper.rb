module ApplicationHelper
    def flash_error
         flash[:error] if flash[:error]
    end
    
    def display_errors(object)
      if object.errors.any? 
        pluralize(object.errors.count, "error")
        "prohibited this arrangement from being saved:"

        object.errors.full_messages.each do |message| 
          message 
        end 
      end
    end

end
