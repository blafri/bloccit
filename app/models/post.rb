class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  has_many :votes, dependent: :destroy
  
  default_scope { order('rank DESC') }
  
  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true
  
  def up_votes
    votes.where(value: 1).count
  end
  
  def down_votes
    votes.where(value: -1).count
  end
  
  def points
    votes.sum(:value)
  end
  
  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24)
    new_rank = points + age_in_days
    
    update_attribute(:rank, new_rank)
  end
  
  def save_with_initial_vote
    transaction do
      save!
      create_vote
    end
    
    # If Transaction was unsuccessful a exception would have been thrown 
    # so rescue it and return false so that you can display something 
    # nice to user
  rescue ActiveRecord::RecordInvalid
    false
  end
  
  def create_vote
    user.votes.create!(value: 1, post: self)
  end
end
