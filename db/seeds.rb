class Seed

  def self.begin
    seed = Seed.new
    seed.destroy_all_records
    seed.generate_destinations
    seed.generate_users
    seed.generate_reviews
    seed.generate_activities
    seed.generate_excursions
  end

  def destroy_all_records
    Destination.destroy_all
    User.destroy_all
    Review.destroy_all
    Activity.destroy_all
    Excursion.destroy_all
  end

  def generate_destinations
    20.times do |i|
      destination = Destination.create!(
                                country: Faker::Address.country,
                                city: Faker::Address.city,
                                description: Faker::Hipster.paragraph(3)
                              )
    end
  end

  def generate_users
    25.times do
      user = User.create!(
                  email: Faker::Internet.email,
                  password: "123password"
                )
    end
  end

  def generate_reviews
    users = User.all
    destinations = Destination.all
    100.times do
      review = Review.create!(
                    rating: Faker::Number.between(1,5).to_i,
                    content: Faker::Lorem.paragraph(2),
                    user_id: users.shuffle.first.id,
                    destination_id: destinations.shuffle.first.id
                  )
    end
  end

  def generate_activities
    activities = %w[hiking swimming glacier-sculpting rock-climbing spa massage snorkeling cupping camping glamping hunting farming fishing mushroom-foraging]
    activities.each do |element|
      activity = Activity.create!(
                      name: element
                      )
    end
  end

  def generate_excursions
    destinations = Destination.all
    activities = Activity.all
    seasons = %w[winter spring summer autumn]
    50.times do
      excursion = Excursion.create!(
                        destination_id: destinations.shuffle.first.id,
                        activity_id: activities.shuffle.first.id,
                        season: seasons.shuffle.first,
                        description: Faker::Lorem.paragraph(2),
                        price: Faker::Number.between(40, 4000).to_i
                        )
    end
  end
end

Seed.begin
