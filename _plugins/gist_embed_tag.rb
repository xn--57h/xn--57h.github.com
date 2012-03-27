module Jekyll
  
  class GistEmbedTag < Liquid::Tag
    
    def initialize(tag_name, gist_url, tokens)
      @gist_url = gist_url
    end
    
    def render(context)
      puts "Render contents of gist: #{gist_url}"
      
    end
    
  end
  
end

Liquid::Template.register_tag('gist', Jekyll::GistEmbedTag)