module ApplicationHelper
  
  def link_to_2(path)
    anchor = "<a href='#{path}'>"
    body = yield
    anchor = anchor + body
    anchor = anchor + "</a>"

    anchor.html_safe
  end
end
