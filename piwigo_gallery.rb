# Jekyll  PiwigoGallery
# 
# Import Gallery from piwigo
#
# Author: Alessandro "alorenzi" Lorenzi <alorenzi@alorenzi.eu>
# Copyright: Copyright 2014 Alessandro Lorenzi
# License: GPLv2 
# Version: 1.0.0
#
require 'net/http'
require 'json' 
module Jekyll
  class PiwigoGallery < Liquid::Tag

    def initialize(tag_name, gallery_id, tokens)
      super
      @gallery_id = gallery_id
    end

    def render(context)
      @config = context.registers[:site].config['piwigogallery']
      @json = get_json
      @images = get_images
      page = ""
      for image in @images
           page += render_image(image)
      end
      page
      
    end

    def get_json
       baseurl = @config['baseurl']
       uri = URI(URI.escape(baseurl + "/ws.php?format=json&method=pwg.categories.getImages&cat_id=" + @gallery_id))
       return Net::HTTP.get(uri) # => String

    end

    def get_images
        my_hash = JSON.parse(@json)
        return my_hash['result']['images']
    end

    def render_image(image)
	element = image['element_url']
        square = image['derivatives']['square']['url']
	return "<a class='fancybox' rel='group' href='"+element+"'><img src='"+square+"' alt='' class='piwigo' /></a>" 
 
    end
  end
end

Liquid::Template.register_tag('piwigo_gallery', Jekyll::PiwigoGallery)



