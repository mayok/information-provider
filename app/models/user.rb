class User < ActiveRecord::Base
  has_many :pages
  has_one :fav
end
