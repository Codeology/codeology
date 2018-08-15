module ApplicationHelper
  def link_to_nav_item(body, url, html_options = {})
    active = "active" if current_page?(url)
    content_tag :a, class: active do
      link_to body, url, html_options
    end
  end

  def gravatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=128"
  end
end
