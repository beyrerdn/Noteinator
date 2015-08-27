# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@commenter = User.create(:email => "commentator@troll.com", :api_token => "mrcNFEuEEvdDE7mrLAdRk2b5Qvg4yZGzqd")

5.times do
  note = Note.create(
  {
    :title => Faker::Lorem.sentence,
    :body => Faker::Lorem.sentences(3),
    :tags => "#{Faker::Lorem.word}, #{Faker::Lorem.word}, #{Faker::Lorem.word}"
  }
  )
  user = User.create(
    :email => Faker::Internet.safe_email,
    :api_token => Faker::Bitcoin.testnet_address
  )
  user.notes << note
  
  Comment.create(
    :body => Faker::Hacker.say_something_smart,
    :user_id => @commenter.id,
    :note_id => note.id)
end
