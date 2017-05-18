class FollowedPage < ApplicationRecord
  validates :url, presence: true
  validates :original_content, presence: true
  validates :selector, presence: true
  
  enum difference_type: [:page_not_found, :selector_not_found, :content_difference]

  # Get the difference between the original content and
  # the updated page
  def content_difference
    nokogiri_doc = Algo.new(url: url)
    updated_content = nokogiri_doc.selected_content(selector: selector)
    
    difference = ''
    if updated_content != original_content
      difference = updated_content.mask('.') - original_content.mask('.')
    end
    difference
  end
end
