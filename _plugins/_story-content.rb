module Jekyll
  class StoryContent < Liquid::Block

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      site = context.registers[:site]
      converter = site.getConverterImpl(::Jekyll::Converters::Markdown)
      output = converter.convert(super(context))
      icon = if @text == 'location' then "<i class='locaiton-icon material-icons'>location_on</i>" else "" end
      "<section class='story-content #{@text}'> #{icon} #{output} </section>"
    end
  end
end

Liquid::Template.register_tag('story_content', Jekyll::StoryContent)
