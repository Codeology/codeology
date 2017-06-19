module ApplicationHelper
    def link_to_nav_item(body, url, html_options = {})
        active = "active" if current_page?(url)
        content_tag :li, class: active do
            link_to body, url, html_options
        end
    end
    def link_to_nav_dropdown_item(body, url, html_options = {})
        active = "active" if current_page?(url)
        content_tag :li, class: active do
            link_to body, url, html_options
        end
    end
end
