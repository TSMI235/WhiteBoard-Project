module DeviseHelper
    def devise_error_messages!
      return "" if resource.errors.empty?
  
      messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
  
      html = <<-HTML
      <div id="error_explanation">
        <ul style="
                padding: 5px;
                margin: 5px;
                text-align: center; 
                color: white; 
                border-radius: 10px; 
                background: rgb(240,128,128); 
                border: 2px solid red;
                text-transform: uppercase;
                list-style-type: none;">
            #{messages}
        </ul>
      </div>
      
      HTML
  
      html.html_safe
    end
  end
  