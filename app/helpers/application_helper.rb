module ApplicationHelper
  def author
    Struct.new(:name, :email).new(enki_config[:author][:name], enki_config[:author][:email])
  end

  def open_id_delegation_link_tags(server, delegate)
    raw links = <<-EOS
      <link rel="openid.server" href="#{server}">
      <link rel="openid.delegate" href="#{delegate}">
    EOS
  end

  def format_comment_error(error)
    {
      'body'   => 'Please comment',
      'author' => 'Please provide your name or OpenID identity URL',
      'base'   => error.last
    }[error.first.to_s]
  end
  
  def format_body_element
    body = '<body>'
    if @posts
      if @posts.first.tags.include?('code')
        body = %Q@<body style="background-image: image-url(graph.png);">@
      elsif @posts.first.tags.include?('music')
        body = %Q@<body style="background-image: image-url(staff.png);">@        
      end
    elsif @post
      if @posts.first.tags.include?('code')
        body = %Q@<body style="background-image: image-url(graph.png);">@
      elsif @posts.first.tags.include?('music')
        body = %Q@<body style="background-image: image-url(staff.png);">@        
      end      
    elsif @page
      if @page.slug == 'code'
        body = %Q@<body style="background-image: image-url(graph.png);">@
      elsif @page.slug == 'music'
        body = %Q@<body style="background-image: image-url(staff.png);">@        
      end
    end
    body.html_safe
  end
  
end
