# Pavel Durov tweets
User.find_by_email('user-10@gmail.com').tweets.create(post: '9 years ago I defended the private data of Ukrainians from the Russian government — and lost my company and my home. I would do it again without hesitation.')
User.find_by_email('user-10@gmail.com').tweets.create(post: 'Telegram: the app at the heart of Ukraine’s propaganda battle.')
Tweet.last.image.attach(io: File.open('app/assets/images/pavel_durov_tweet.jpg'),
                        filename: 'pavel_durov_tweet.jpg',
                        content_type: 'image/jpg')

# Edward Snowden tweets
User.find_by_email('user-9@gmail.com').tweets.create(post: 'Children have their own gravity—one that attracts time.')
User.find_by_email('user-9@gmail.com').tweets.create(post: '"You cannot travel into the area unless you have proof of exclusion. https://twitter.com/OttawaPolice/status/1495420417846267916')

# Mark Zuckerberg tweets
User.find_by_email('user-8@gmail.com').tweets.create(post: 'I am afraid that elon bought twitter.')

# Satya Nadella tweets
User.find_by_email('user-7@gmail.com').tweets.create(post: 'We’re removing limits on how and where you work with Windows 11 and Windows 365. Together, they bring the power of Azure computing to Windows computers.')

# Lisa Su tweets
User.find_by_email('user-4@gmail.com').tweets.create(post: 'Looking forward to our keynote @computex_taipei on May 23rd.  Excited to share the latest in high-performance computing from @amd and our ecosystem partners!')
Tweet.last.image.attach(io: File.open('app/assets/images/lisa_su_tweet.jpeg'),
                        filename: 'lisa_su_tweet.jpeg',
                        content_type: 'image/jpeg')

# Sundar Pichai tweets
User.find_by_email('user-3@gmail.com').tweets.create(post: 'Nice to be back IRL at Shoreline! See you soon:) #GoogleIO')
Tweet.last.image.attach(io: File.open('app/assets/images/sundar_pichai_tweet.jpeg'),
                        filename: 'sundar_pichai_tweet.jpeg',
                        content_type: 'image/jpeg')
# Bill gates tweets
User.find_by_email('user-3@gmail.com').tweets.create(post: 'Bono, you’re just as amazing a philanthropist as you are a friend. Working and learning together has been one of my greatest joys.')
Tweet.last.image.attach(io: File.open('app/assets/images/bill_gates_tweet_2.jpeg'),
                        filename: 'bill_gates_tweet_2.jpeg',
                        content_type: 'image/jpeg')

User.find_by_email('user-3@gmail.com').tweets.create(post: 'I’m answering your questions now on @Reddit: https://gatesnot.es/3wDdAA9')
Tweet.last.image.attach(io: File.open('app/assets/images/bill_gates_tweet_1.jpeg'),
                        filename: 'bill_gates_tweet_1.jpeg',
                        content_type: 'image/jpeg')

# Elon Musk tweets
User.find_by_email('user-2@gmail.com').tweets.create(post: "In the past I voted Democrat, because they were (mostly) the kindness party.\nBut they have become the party of division & hate, so I can no longer support them and will vote Republican.\nNow, watch their dirty tricks campaign against me unfold …")
User.find_by_email('user-2@gmail.com').tweets.create(post: 'To be clear, I’m spending <5% (but actually) of my time on the Twitter acquisition. It ain’t rocket science! Yesterday was Giga Texas, today is Starbase. Tesla is on my mind 24/7. So may seem like below, but not true.')
User.find_by_email('user-2@gmail.com').tweets.create(post: 'Next up! Uber https://www.uber.com/bd/en/')
Tweet.last.image.attach(io: File.open('app/assets/images/elon_tweet.jpeg'),
                        filename: 'elon_tweet.jpeg',
                        content_type: 'image/jpeg')
