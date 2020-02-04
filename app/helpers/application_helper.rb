module ApplicationHelper

  include Pagy::Frontend
  
  def bulma_class_for flash_type
    { success: "success", error: "danger", alert: "warning", notice: "success" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:article, class: "message is-#{bulma_class_for(msg_type)}") do
              concat content_tag(:div, message, class:'message-body') 
            end)
    end
    nil
  end

end
