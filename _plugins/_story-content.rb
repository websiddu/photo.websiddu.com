module Jekyll
  class StoryContent < Liquid::Block

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "<section class='story-content #{@text}'> <p> #{ super } </p> </section>"
    end
  end
end

Liquid::Template.register_tag('story_content', Jekyll::StoryContent)
