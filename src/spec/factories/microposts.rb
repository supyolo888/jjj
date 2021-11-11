FactoryBot.define do

  factory :micropost do

    content {"I just ate an orange!"}
    created_at {10.minutes.ago}
    association :user

    trait :tau_manifesto do
      content {"Check out the @tauday site by @mhartl: https://tauday.com"}
      created_at {3.years.ago}
    end

    trait :cat_video do
      content {"Sad cats are sad: https://youtu.be/PKffm2uI4dk"}
      created_at {2.hours.ago}
    end

    trait :most_recent do
      content {"Writing a short test"}
      created_at{Time.zone.now}
    end

    trait :microposts do
      content {Faker::Lorem.sentence(word_count: 5)}
    end

  end

end
