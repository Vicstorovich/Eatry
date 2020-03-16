FactoryBot.define do
  factory :menu do
    name { Date.yesterday.inspect }
    start_time { Date.yesterday.inspect }
  end

  sequence :names do |n|
     Date.yesterday.inspect + "#{n}"
  end

  factory :menus, parent: :menu do
    name { generate(:names) }
    start_time { generate(:names) }
  end
end
