class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic
  has_one :summary
  
  def create_summary_path_for_view
    if summary
      {controller: 'summaries', action: 'show', post_id: id}
    else
      {controller: 'summaries', action: 'new', post_id: id}
    end
  end
  
  default_scope { order('created_at DESC') }
end
