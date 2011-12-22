module ApplicationHelper
 
  # Return a title on a per-page basis.
  def title
    base_title = "Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  # Listing 9.27 A helper for the site logo (used in _header.html.erb)
	def logo
		image_tag("logo.png", :alt => "Sample App", :class => "round")
	end

end
