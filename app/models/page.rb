require 'nokogiri'
require 'open-uri'

class Page < ActiveRecord::Base
  include ApplicationHelper
  belongs_to :user

  def prepare url
    tags_array = Array.new

    html = Nokogiri::HTML open(url)
    tags = html.css('.tagIcon_name')
    tags.each do |tag|
      tags_array.push tag.content.downcase
    end

    tags_array = tag_normalize tags_array
    if tags_array.empty?
      return
    end

    title = html.css('.itemsShowHeaderTitle_title').first.content
    content = html.css('.markdownContent').first.inner_html

    Page.new(
      {
        title: title,
        content: content,
        url: url,
        user_id: 0,
        tags: tags_array.join(', ')
      }
    ).save
  end
end
