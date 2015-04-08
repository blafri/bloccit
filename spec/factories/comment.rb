FactoryGirl.define do
  factory :comment do
    body "This is a new comment."
    user
    post

    after(:build) do |comment|
      comment.class.skip_callback(:create, :after, :send_favorite_emails)
    end
  end
  
  factory :comment_no_stub_email, class: Comment do
    body "This is a new comment."
    user
    post
  end
end