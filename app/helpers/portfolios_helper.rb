module PortfoliosHelper

 def image_generator(height:, width:)
	"http://via.placeholder.com/#{height}x#{width}"
  end

	  def portfolio_img img, type


    if type == "thumb"
      if img.model.thumbnail_image?
        img
      else
        image_generator(height: '208', width: '124')
      end
    elsif type == 'main'
      if img.model.main_image?
        img
      else
        image_generator(height: '600', width: '400')
      end
    end

  end


  def gallery_img img, type
    if img.model.image?
      img
    elsif type == 'thumb'
      image_generator(height: '208', width: '124')
    elsif type == 'main'
      image_generator(height: '600', width: '400')
    end
  end

end
