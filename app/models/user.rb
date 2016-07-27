class User < ActiveRecord::Base
  PAGE_NUM = 10

  has_many :pages
  has_one :fav
  accepts_nested_attributes_for :fav

  def self.init_pages hash
    output = Array.new
    tags = hash.select{ |k,v| v.to_i > 0 }.keys

    tags.each do |tag|
      pages = Page.where("tags like ?", "%#{tag}%")
      pages = pages.sample( PAGE_NUM / tags.size )

      pages.each do |page|
        output.push({
          title: page.title,
          content: page.content,
          url: page.url,
          tags: page.tags
        })
      end

    end

    output.uniq
  end
end
