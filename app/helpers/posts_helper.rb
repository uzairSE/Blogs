module PostsHelper
    def is_button 
        content_tag(:div)do
        content_tag(:button, "Click",:onclick => "alert('This is a button')")  
                end
    end
end
