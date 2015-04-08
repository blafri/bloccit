FactoryGirl.define do
  factory :vote do
    user
    post
    
    factory :up_vote do
      value 1
    end
    
    factory :down_vote do
      value -1
    end
    
    factory :non_valid_vote do
      value 5
    end
  end
end