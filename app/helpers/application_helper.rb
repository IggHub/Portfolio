module ApplicationHelper
  def login_helper style=""
     if current_user.is_a?(GuestUser)
       (link_to "Login", new_user_session_path, class: style) + "\n" +
       (link_to "Register", new_user_registration_path, class: style)
     else
       (link_to "Edit", edit_user_registration_path, class: style) + "\n" +
       (link_to "Logout", destroy_user_session_path, method: :delete, class: style)
     end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}! You are on #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    IggyViewTool::Renderer.copyright "Igor Irianto", "All rights reserved"
  end
end
