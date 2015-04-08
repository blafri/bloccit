FactoryGirl.define do
  factory :topic do
    name "This is a new topic"
    description "This is a simple topic description for a created topic"
    
    factory :private_topic do
      public false
    end
  end
end