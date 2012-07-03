module PostsHelper
  # This isn't strictly correct, but it's a pretty good guess
  # and saves another hit to the DB
  def more_content?
    @posts.size == Post::DEFAULT_LIMIT
  end
  def format_bg_class(post)
    bg_class = ''
    tag_names = post.tags.map(&:name)
    if tag_names.include?("hacking")
      bg_class = "graph"
    elsif tag_names.include?("playing")
      bg_class = "staff"
    else 
      bg_class = 'puzzle'
    end
    return bg_class
  end
  def format_post_styles(max_width)
    sides = %w{top right bottom left}
    colors = %w{darkorange darkgreen darkblue}
    rand_side = sides[rand(4).round]
    rand_color = colors[rand(3).round]
    color_match = nil  
    border_styles = sides.inject([]) do |styles, side| 
      rand_width = "#{rand(max_width).round}px"    
      if side.eql?(rand_side)
        styles << "border-#{side}-color: #{rand_color}"
        color_match = true
      else 
        if color_match == true
          styles << "border-#{side}-color: #999"
          color_match = false;          
        end
      end
      styles << "border-#{side}-width: #{rand_width}" 
    end
    border_styles.join(";")
  end  
  
end
