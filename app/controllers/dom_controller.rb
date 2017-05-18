class DomController < ApplicationController
  def follow
    @url = 'lemonde.html' #'http://google.com/search?q=tenderlove'
    nokogiri_doc = Algo.new(url: @url)
    @html = nokogiri_doc.html
  end
  
  def follow_confirmation
    @url = params[:url]
    @selector = params[:selector]
    nokogiri_doc = Algo.new(url: @url)
    @html = nokogiri_doc.confirmation(selector: @selector) 
   

    @followed_page = FollowedPage.new(
      url: @url,
      original_content: nokogiri_doc.selected_content(selector: @selector),
      selector: @selector
    )                 
  end
end
