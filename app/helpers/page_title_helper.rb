module PageTitleHelper
  def posts_title(tag)
    compose_title((tag || "").to_s.titleize)
  end

  def post_title(post)
    compose_title(post.title)
  end

  def archives_title
    compose_title("what i was yesterday")
  end

  def page_title(page)
    compose_title(page.title)
  end

  def html_title(content)
    if content.present?
      content
    else
      enki_config[:title]
    end
  end

  private

  def compose_title(*parts)
    (parts.unshift(enki_config[:title])).reject(&:blank?).join(" ").downcase+"."
  end
end
