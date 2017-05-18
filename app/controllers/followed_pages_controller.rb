class FollowedPagesController < ApplicationController
  
  def new
    @url = params[:url]
    @selector = params[:selector]
  end
  
  def show
    @followed_page = FollowedPage.find(params[:id])
    doc = Algo.new(url: @followed_page.url)
    @html = doc.selected_content(selector: @followed_page.selector)
  end

  def create
    @followed_page = FollowedPage.new(followed_page_params)
    if @followed_page.save
      redirect_to @followed_page
    else
      redirect_to follow_path
    end
  end
  
  private
  
  def followed_page_params
    params.require(:followed_page).permit(
      :url, :selector, :original_content 
    )
  end
end
