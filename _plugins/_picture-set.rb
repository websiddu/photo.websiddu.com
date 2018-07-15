require 'fastimage'

module Jekyll
  class PictureSet < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def get_ratio(url)
      size = FastImage.size(url)
      orig_width = size[0]
      orig_height = size[1]
      orig_ratio = orig_width*1.0/orig_height
      orig_ratio
    end

    def render(context)

      render_markup = Liquid::Template.parse(@text).render(context).gsub(/\\\{\\\{|\\\{\\%/, '\{\{' => '{{', '\{\%' => '{%')

      tarnsform = "";
      url = "http://res.cloudinary.com/websiddu/image/upload/w_auto/photos/#{render_markup}"
      smallUrl = "http://res.cloudinary.com/websiddu/image/upload/c_scale,w_100/photos/#{render_markup}"

      webp = "#{url}.webp";
      smallwebp = "#{smallUrl}.webp"

      jpg = "#{url}.jpg"
      smalljpg = "#{smallUrl}.jpg"
      ratio = get_ratio(smalljpg)

      """<div class='column picture-wrap' data-ratio='#{ratio.to_s}'><picture><img data-src='#{webp}' class='cld-responsive' alt='#{render_markup}'></picture></div>
      """
    end
  end
end

Liquid::Template.register_tag('picture_set', Jekyll::PictureSet)
