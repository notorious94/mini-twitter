istiad_id = User.find_by_email('user-1@gmail.com').id
elon_musk_id = User.find_by_email('user-2@gmail.com').id
bill_gates_id = User.find_by_email('user-3@gmail.com').id
sundars_id = User.find_by_email('user-4@gmail.com').id
lisa_su_id = User.find_by_email('user-5@gmail.com').id
huangs_id = User.find_by_email('user-6@gmail.com').id
nadella_id = User.find_by_email('user-7@gmail.com').id
zuckerberg_id = User.find_by_email('user-8@gmail.com').id
snowden_id = User.find_by_email('user-9@gmail.com').id
pavel_id = User.find_by_email('user-10@gmail.com').id

# Elon musk follows -> Lisa Su, Bill Gates, Mark Zuckerberg
Relationship.find_or_create_by(follower_id: elon_musk_id, followed_id: bill_gates_id)
Relationship.find_or_create_by(follower_id: elon_musk_id, followed_id: lisa_su_id)
Relationship.find_or_create_by(follower_id: elon_musk_id, followed_id: zuckerberg_id)

# Bill gates follows -> Elon Musk, Pavel Durov, Lisa Su
Relationship.find_or_create_by(follower_id: bill_gates_id, followed_id: pavel_id)
Relationship.find_or_create_by(follower_id: bill_gates_id, followed_id: lisa_su_id)
Relationship.find_or_create_by(follower_id: bill_gates_id, followed_id: elon_musk_id)

# Sundar follows -> Lisa su, Bill Gates, Pavel
Relationship.find_or_create_by(follower_id: sundars_id, followed_id: lisa_su_id)
Relationship.find_or_create_by(follower_id: sundars_id, followed_id: bill_gates_id)
Relationship.find_or_create_by(follower_id: sundars_id, followed_id: pavel_id)

# Lisa su follows -> Jensen Huang, Zuckerberg, Elon
Relationship.find_or_create_by(follower_id: lisa_su_id, followed_id: huangs_id)
Relationship.find_or_create_by(follower_id: lisa_su_id, followed_id: zuckerberg_id)
Relationship.find_or_create_by(follower_id: lisa_su_id, followed_id: elon_musk_id)

# Jensen follow -> Satya, Elon, Bill
Relationship.find_or_create_by(follower_id: huangs_id, followed_id: nadella_id)
Relationship.find_or_create_by(follower_id: huangs_id, followed_id: elon_musk_id)
Relationship.find_or_create_by(follower_id: huangs_id, followed_id: bill_gates_id)

# Nadella follows -> Sundar, Bill Gates, Snowden
Relationship.find_or_create_by(follower_id: nadella_id, followed_id: sundars_id)
Relationship.find_or_create_by(follower_id: nadella_id, followed_id: snowden_id)
Relationship.find_or_create_by(follower_id: nadella_id, followed_id: bill_gates_id)

# Zuckerberg follows -> Jensen Huang, Sundar Pichai, Edward Snowden
Relationship.find_or_create_by(follower_id: zuckerberg_id, followed_id: snowden_id)
Relationship.find_or_create_by(follower_id: zuckerberg_id, followed_id: huangs_id)
Relationship.find_or_create_by(follower_id: zuckerberg_id, followed_id: sundars_id)

# Edward follows -> Istiad, Elon, Lisa
Relationship.find_or_create_by(follower_id: snowden_id, followed_id: istiad_id)
Relationship.find_or_create_by(follower_id: snowden_id, followed_id: elon_musk_id)
Relationship.find_or_create_by(follower_id: snowden_id, followed_id: lisa_su_id)

# Pavel follows -> Jensen, Sundar, Lisa
Relationship.find_or_create_by(follower_id: pavel_id, followed_id: huangs_id)
Relationship.find_or_create_by(follower_id: pavel_id, followed_id: sundars_id)
Relationship.find_or_create_by(follower_id: pavel_id, followed_id: lisa_su_id)
