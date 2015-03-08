class SummaryPolicy < ApplicationPolicy
  
  def update?
    user.present? && (record.post.user == user || user.admin?)
  end
  
end