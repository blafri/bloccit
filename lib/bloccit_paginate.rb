module BloccitPaginate
  
  def paginate(options = {})
    page = options[:page] ? options[:page].to_i : 1
    
    per_page = options[:per_page] || 10
    
    limit(per_page).offset((page - 1) * per_page)
  end
  
  module BloccitPaginateHelper
    
    def will_paginate(collection)
      total_records = collection.unscope(:limit, :offset).count
      per_page = collection.values[:limit]
      current_page = (collection.values[:offset] / per_page) + 1
      
      # Find Total amount of pages
      if (total_records % per_page) == 0
        pages = total_records / per_page
      else
        pages = (total_records / per_page) + 1
      end
      
      content_tag(:ul, class: 'pagination') do
        concat current_page == 1 ? content_tag(:li, link_to('&laquo;'.html_safe), class: 'disabled') :
          content_tag(:li, link_to('&laquo;'.html_safe, "#{request.path}?page=#{current_page - 1}"))
        
        pages.times do |page|
          page += 1
          concat page == current_page ? content_tag(:li, link_to(page, "#{request.path}?page=#{page}"), class: 'active') :
            content_tag(:li, link_to(page, "#{request.path}?page=#{page}"))
        end
        
        concat current_page == pages ? content_tag(:li, link_to('&raquo;'.html_safe), class: 'disabled') :
          content_tag(:li, link_to('&raquo;'.html_safe, "#{request.path}?page=#{current_page + 1}"))
      end 
    end
    
  end
  
end