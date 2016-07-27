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

  def self.simlilar_user_calculate(current_user)
    similarity = 0
    best_user_id = 0

    User.all.each do |u|
      current_user_tags = Array.new
      similar_user_tags = Array.new
      [:web, :mobile, :os, :editor, :lang, :services].each do |tag|
        current_user_tags.push current_user.fav.send(tag)
        if u.id == current_user.id
          similar_user_tags.push 0
        else
          similar_user_tags.push u.fav.send(tag)
        end
      end

      _similarity = User.cos_similarity(current_user_tags, similar_user_tags)

      if _similarity > similarity
        similarity = _similarity
        best_user_id = u.id
      end
    end

    User.find_by(id: best_user_id)
  end

  def self.cos_similarity a1, a2
    x = sA = sB = 0
    ApplicationController.helpers._tags.size.times do |i|
      x += a1[i] * a2[i]
      sA += a1[i] * a1[i]
      sB += a2[i] * a2[i]
    end
    sA = Math.sqrt(sA)
    sB = Math.sqrt(sB)

    return x / (sA * sB)
  end
end
