def render_active_page(page)
  return "class='active'" if controller.action_name == 'view_page' and params[:name].to_s == page
end

def render_active_archives
  if controller.controller_name == 'articles'
    if controller.action_name == 'index'
      return if params[:page].empty?
    else
      return "class='active'" 
    end
  end
end

def render_active_index
  if controller.controller_name == 'article'
    return unless controller.action_name == 'index'
    return "class='active'" if params[:page].empty?
  end
end

def render_active_categories
  return "class='active'" if controller.controller_name == 'categories'
end

def render_active_tags
  return "class='active'" if controller.controller_name == 'tags'
end
