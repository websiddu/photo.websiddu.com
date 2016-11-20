module Jekyll
  class PhotoSet < Liquid::Block

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "<section class='photo-set #{@text} columns'> #{ super }</section>"
    end
  end
end

Liquid::Template.register_tag('photoset', Jekyll::PhotoSet)
