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

  def body_background_class
    "bg_big_graph"
  end
  
  def body_background_styles
    "background-position: #{rand(100).round}% #{rand(100).round}%"
  end
  
  # def body_background_class
  #   body_class = default_class = 'bg_puzzle'
  #   code_class = 'bg_graph'
  #   music_class = 'bg_staff'    
  #   archive_class = 'bg_maze'        
  #   if @posts
  #     tags = @posts.first.tags
  #     if tags.detect{|tag| tag.name == 'code'}
  #       body_class = code_class
  #     elsif tags.detect{|tag| tag.name == 'music'}
  #       body_class = music_class
  #     end
  #   elsif @months
  #     body_class = archive_class
  #   elsif @post
  #     tags = @post.tags
  #     if tags.detect{|tag| tag.name == 'code'}
  #       body_class = code_class
  #     elsif tags.detect{|tag| tag.name == 'music'}
  #       body_class = music_class
  #     end      
  #   elsif @page
  #     if @page.slug == 'code'
  #       body_class = code_class
  #     elsif @page.slug == 'music'
  #       body_class = music_class
  #     end
  #   end
  #   body_class
  # end
  
end
