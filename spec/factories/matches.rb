FactoryGirl.define do
  factory :match do
    game_id {rand(100)}
    duration 0
    open_status true
  end
end