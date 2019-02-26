module ApplicationHelper
    def flash_error
         flash[:error] if flash[:error]
    end
end
