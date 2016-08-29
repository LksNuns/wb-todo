FactoryGirl.define do
  factory :task do
    sequence(:body) { |n| "Task#{n}" }
    finished false

    factory :finished_task do
      finished true
    end
  end
end
