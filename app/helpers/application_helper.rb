module ApplicationHelper
  def _tags
    [:web, :mobile, :os, :editor, :lang, :services]
  end

  def _web
    [:html, :javascript, :css, :html5, :jquery, :css3, :coffeescript]
  end

  def _mobile
    [:iphone, :android, :ios, :swift]
  end

  def _os
    [:linux, :mac, :macosx, :centos, :ubuntu]
  end

  def _editor
    [:vim, :emacs]
  end

  def _lang
    [:php, :java, :ruby, :python, :c, :rails, :perl, :haskell, :scala]
  end

  def _services
    [:twitter, :nginx, :facebook, :heroku]
  end

  def tag_normalize tags
    tags_array = []

    tags.each do |tag|

      if _web.include? tag.intern
        tags_array.push "web"
      elsif _mobile.include? tag.intern
        tags_array.push "mobile"
      elsif _os.include? tag.intern
        tags_array.push "os"
      elsif _editor.include? tag.intern
        tags_array.push "editor"
      elsif _lang.include? tag.intern
        tags_array.push "lang"
      elsif _services.include? tag.intern
        tags_array.push "services"
      end
    end

    tags_array.uniq
  end
end
