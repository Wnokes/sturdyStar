module ApplicationHelper
	def nav_helper style, tag_type
		nav_links = ''

		nav_items.each do |item|
			nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
		end

		nav_links.html_safe
	end

	def active? path
		"active" if current_page? path
	end

	def nav_items
		[
			{
				url: root_path,
				title: 'Home'
			},
			{
				url: blogs_path,
				title: 'Reviews'
			},
			# {
			# 	url: new_support_path,
			# 	title: 'Contact'
			# },
		]
	end

	def alerts
		alert = (flash[:alert] || flash[:error] || flash[:notice])

		if alert
			alert_generator alert
		end
	end

	def alert_generator msg
		js add_gritter(msg, sticky: false, time: 1000)
	end

	def copyright_generator
		VerbalPantsCoolViewTool::Renderer.copyright 'Paraiso Gaming Studios', 'All rights reserved'
	end
	
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true,
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
end
