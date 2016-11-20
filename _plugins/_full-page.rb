module Jekyll
  class FullPage < Liquid::Block

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      """<section class='hero columns is-fullheight'>
            #{ super }
        </section>"""
    end
  end
end

Liquid::Template.register_tag('full_page', Jekyll::FullPage)
