module Jekyll
  require 'haml'
  class HamlConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /haml/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      engine = Haml::Engine.new(content)
      engine.render
    end
  end

  require 'sass'
  class SassConverter < Converter
    safe true
    priority :low

     def matches(ext)
      ext =~ /sass/i
    end

    def output_ext(ext)
      ".css"
    end

    def convert(content)
      engine = Sass::Engine.new(content)
      engine.render
    end
  end
  
  class ScssConverter < Converter
    safe true
    priority :low
    
    def matches(ext)
      ext =~ /scss/i
    end
    
    def output_ext(ext)
      ".css"
    end
    
    def convert(content)
      engine = Sass::Engine.new(content, :syntax => :scss)
      engine.render
    end
    
  end
  
  require 'coffee-script'
  
  class CoffeeConverter < Converter
    safe true
    priority :low
    
    def matches(ext)
      ext =~ /coffee/i
    end
    
    def output_ext(ext)
      ".js"
    end
    
    def convert(content)
      begin
        CoffeeScript.compile(content)
      rescue StandardError => e
        puts "CoffeeScript error: " + e.message
      end
    end
    
  end
  
end