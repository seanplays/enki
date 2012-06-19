module PageTitleHelper
  def posts_title(tag)
    compose_title((tag || "").to_s.titleize)
  end

  def post_title(post) 
    compose_title(post.title)
  end

  def archives_title
    compose_title("yesterday")
  end

  def page_title(page)
    compose_title(page.title)
  end

  def html_title(content)
    # if content.present?
    #   content
    # else
    #   enki_config[:title]
    # end
    compose_title("sean o'donnell")
  end

  def html_subtitle(text, options = {})
    unless text.blank?
      html = %w{.}
      html.unshift(link_to(text, posts_path(text), options))
      return html.join.html_safe
    end
  end

  private

  def compose_title(*parts)
    (parts.unshift(enki_config[:title])).reject(&:blank?).join(" ").downcase+"."
  end
end
