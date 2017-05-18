class Algo
  
  attr_accessor :url
  attr_accessor :doc
  
  def initialize(attributes)
    @url = attributes[:url]
    html = Rails.cache.fetch @url, expires_in: 1.minute do
      open(@url).read
    end
    @doc = Nokogiri::HTML(html)
  end
  
  def header
    header = ''
    head = @doc.search 'head'
    head.children.each do |c|
      if c.name == 'style'
        header << c.to_s
      end
    end
    header
  end
  
  def confirmation(selector:)
    html = '<div id="body">'    
    html += header
    
    body = @doc.search 'body'
    selected_part = body.search selector
    selected_part.search('a').each do |link|
      link.name = 'span'
    end
    html += selected_part.to_s
    html
  end

  def html
    html = '<div id="body">'
    
    html += header

    body = @doc.search 'body'
    # Remove all the links
    links = body.search 'a'
    links.each do |link|
      link.name = 'span'
    end
    
    body.children.each do |test|
      html += test.to_s
    end
    html += '</div>'
  end
  
  def selected_content(selector:)
    selected_part = @doc.search selector
    selected_part.to_s
  end
end
