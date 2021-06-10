FactoryBot.define do
  factory :time_entry do
    start_at { (Time.zone.now - 4.hours).to_i }
    end_at { (Time.zone.now).to_i }
    day { Date.today }
    association(:user)
  end
end
