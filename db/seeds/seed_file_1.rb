names = [
  'Admin User',
  'Elon Musk',
  'Bill Gates',
  'Sundar Pichai',
  'Lisa Su',
  'Jensen Huang',
  'Satya Nadella',
  'Mark Zuckerberg',
  'Edward Snowden',
  'Pavel Durov'
]

names.each_with_index do |name, _i|
  user_email = "user-#{_i + 1}@twitter.com"

  user = User.find_or_initialize_by(email: user_email)
  next if user.persisted?

  user.name = name
  user.username = "user-#{_i + 1}"
  user.password = 123_456
  user.password_confirmation = 123_456
  user.gender = User::MALE
  user.save

  next if name.eql?('Admin User')

  puts user.name
  profile_image_file_name = "#{user.name.downcase.split(' ').join('_')}_profile.jpg"


  user.profile_image.attach(io: File.open("app/assets/images/#{profile_image_file_name}"),
                            filename: profile_image_file_name,
                            content_type: 'image/jpg')

  cover_image_file_name = "#{user.name.downcase.split(' ').join('_')}_cover.jpeg"
  user.cover_photo.attach(io: File.open("app/assets/images/#{cover_image_file_name}"),
                          filename: cover_image_file_name,
                          content_type: 'image/jpeg')

end

