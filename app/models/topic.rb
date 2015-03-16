class Topic < ActiveRecord::Base
  extend BloccitPaginate
  
  has_many :posts
end
