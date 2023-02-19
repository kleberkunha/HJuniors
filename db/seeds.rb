# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
10.times do
  User.create!(
    [
      email: Faker::Internet.email,
      password: "123456",
      reset_password_token: nil,
      reset_password_sent_at: nil,
      remember_created_at: nil,
      sign_in_count: 1,
      current_sign_in_at: "2014-12-31 22:27:09",
      last_sign_in_at: "2014-12-31 22:27:09",
      current_sign_in_ip: "127.0.0.1",
      last_sign_in_ip: "127.0.0.1",
      first_name: "Jubileu",
      last_name: "Pipoca",
      status: Faker::Job
    ]
  )
end
