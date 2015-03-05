class PostPolicy < ApplicationPolicy
  
  def index?
    true
  end
  
  class Scope < Scope
    
    def resolve
      # check if a user is signed in
      # if not signed in return an empty Post::ActiveRecord_Relation
      return scope.none unless user
      
      # If user is an admin or moderator they can see everything
      # Else they can only see there posts
      if user.admin? || user.moderator?
        scope.all
      else
        user.posts
      end
    end
    
  end
  
end