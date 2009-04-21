def render_active_page(page)
  return "class='active'" if controller.action_name == 'view_page' and params[:name].to_s == page
end

def render_active_archives
  if controller.controller_name == 'articles'
    if controller.action_name == 'index'
      return unless params[:page]
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

def render_similar_posts(article)
  unless article.tags.empty?
  	mylist = Array.new
  	article.tags.each do |tag| 
  		mylist += Tag.find_by_name(tag.name).articles
  	end
    mylist = mylist.uniq
    tablo = mylist.sort_by {rand}[0,5]

    html = "<div id='related'>"
    html << "<h3>À lire également</h3>"
    html << "<p>Si <em>#{article.title}</em> vous a intéressé, vous pouvez poursuivre votre lecture avec ces billets similaires :</p>"
  	html << "<ul>"

    tablo.each do |article|
      html << "<li>#{link_to article.title, article.permalink_url}</li>"
    end
    html << "</ul>"
    html << "</div>"
  end
end

def pluralize_comments(comments)
  "#{comments} #{pluralize(comments, 'commentaire', 'commentaire', 'commentaires')}"
end

def category_name(id)
  category = Category.find_by_permalink(id)
  category.name
end