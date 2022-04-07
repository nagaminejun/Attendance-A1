# coding: utf-8

User.create!(name: "管理者",
             email: "sample@email.com",
             employee_number: 1,
             password: "password",
             password_confirmation: "password",
             department: "総務",
             admin: true)

User.create!(name: "上長A",
             email: "sampleA@email.com",
             employee_number: 2,
             password: "password",
             password_confirmation: "password",
             department: "総務",
             superior: true)

User.create!(name: "上長B",
             email: "sampleB@email.com",
             employee_number: 3,
             password: "password",
             password_confirmation: "password",
             department: "総務",
             superior: true)

 7.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               employee_number: n+4,
               password: password,
               password_confirmation: password)
end