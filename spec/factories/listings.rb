FactoryBot.define do
  factory :listing do
    path { Dir.pwd}
    update_time { Time.now }
  end
end
