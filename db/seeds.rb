# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Challenger.destroy_all

Challenger.create(:title =>'Music',
               :caption =>
                   %{My nose is running},
               :homage_url =>'american_gothic.jpg',
               :colour => 'Red',
               :location =>'Kitchen',
               :theme => 'Educational',
               :timescale => '1 minute')

Challenger.create(:title =>'Hair',
               :caption =>
                   %{Investments may go up as well as down},
               :homage_url =>'babylon.jpg',
               :colour => 'Orange',
               :location =>'Sitting Room',
               :theme => 'Weather',
               :timescale => '5 minutes')

Challenger.create(:title =>'Cats',
               :caption =>
                   %{Our customers always come first},
               :homage_url =>'bacon1.jpg',
               :colour => 'Yellow',
               :location =>'Stairs',
               :theme => 'Experimental',
               :timescale => '10 minutes')

Challenger.create(:title =>'Dogs',
               :caption =>
                   %{Now that's a weird fortune cookie},
               :homage_url =>'beeker_scream!.jpg',
               :colour => 'Blue',
               :location =>'Lift',
               :theme => 'Family',
               :timescale => '15 minutes')

Challenger.create(:title =>'Birds',
               :caption =>
                   %{Real men don't use mobile phones},
               :homage_url =>'Caravaggio2.jpg',
               :colour => 'Brown',
               :location =>'Basement',
               :theme => 'Psychedelic',
               :timescale => '27 minutes')

Challenger.create(:title =>'Swimming',
               :caption =>
                   %{Hop along Cassidy},
               :homage_url =>'caravaggio1.jpg',
               :colour => 'Green',
               :location =>'Cellar',
               :theme => 'Wet',
               :timescale => '45 minutes')

Challenger.create(:title =>'Robo Cop',
               :caption =>
                   %{Ooh! Aah! Ooh! Aah! Aah! Ooh!},
               :homage_url =>'cat_circus.jpg',
               :colour => 'Acid Green',
               :location =>'Porch',
               :theme => 'Dry',
               :timescale => '50 minutes')

Challenger.create(:title =>'Special Equations',
               :caption =>
                   %{Where's the remote?},
               :homage_url =>'circus_50s1.jpg',
               :colour => 'Violet',
               :location =>'Driveway',
               :theme => 'Painful',
               :timescale => '60 minutes')

Challenger.create(:title =>'A night on the tiles',
               :caption =>
                   %{Whisk slowly until stiff},
               :homage_url =>'circus_50s2.jpg',
               :colour => 'Almond',
               :location =>'Field',
               :theme => 'Happiness',
               :timescale => '1 hour')

Challenger.create(:title =>'Timber!!!!',
               :caption =>
                   %{Well then it's unanimous!},
               :homage_url =>'crazycatart.jpg',
               :colour => 'Amber',
               :location =>'Doorway',
               :theme => 'Sadness',
               :timescale => '2 hours')

Challenger.create(:title =>'Ready for work!',
               :caption =>
                   %{You think this is weird?},
               :homage_url =>'dali1.jpg',
               :colour => 'Rose',
               :location =>'Closet',
               :theme => 'Gloom',
               :timescale => '3 hours')

Challenger.create(:title =>'Karma karma karma chameleon',
               :caption =>
                   %{You call that art?},
               :homage_url =>'davinci1.jpg',
               :colour => 'Purple',
               :location =>'Cupboard',
               :theme => 'Musical',
               :timescale => '4 hours')

Challenger.create(:title =>'Worst Photo ever',
               :caption =>
                   %{This suit looked way better in the shop!},
               :homage_url =>'davinci2.jpg',
               :colour => 'Navy',
               :location =>'Dollshouse',
               :theme => 'German',
               :timescale => '10 hours')

Challenger.create(:title =>'LOL kat',
               :caption =>
                   %{There goes the neighbourhood},
               :homage_url =>'davinci3.jpg',
               :colour => 'White',
               :location =>'House',
               :theme => 'French',
               :timescale => '15 hours')

Challenger.create(:title =>'Sneaking in sneakers',
               :caption =>
                   %{Halftime already?},
               :homage_url =>'GnG1.jpg',
               :colour => 'Black',
               :location =>'Shed',
               :theme => 'English',
               :timescale => '24 hours')

Challenger.create(:title =>'Too much food!',
               :caption =>
                   %{I never know what to pack!},
               :homage_url =>'GnG2.jpg',
               :colour => 'Beige',
               :location =>'Balcony',
               :theme => 'American',
               :timescale => '48 hours')

Challenger.create(:title =>'Eating',
               :caption =>
                   %{Well that was abominable!},
               :homage_url =>'GnG3.jpg',
               :colour => 'Aqua',
               :location =>'Car',
               :theme => 'Spanish',
               :timescale => '12 hours')

Challenger.create(:title =>'Singing',
               :caption =>
                   %{Take me to your leader},
               :homage_url =>'holbein1.jpg',
               :colour => 'Apricot',
               :location =>'Van',
               :theme => 'Italian',
               :timescale => '1 day')

Challenger.create(:title =>'Digging',
               :caption =>
                   %{Worst. Costume. Ever.},
               :homage_url =>'koons1.jpg',
               :colour => 'Aquamarine',
               :location =>'Truck',
               :theme => 'Dutch',
               :timescale => '2 days')

Challenger.create(:title =>'Eggs!',
               :caption =>
                   %{Holy nick of time, Batman!},
               :homage_url =>'koons2.jpg',
               :colour => 'Turquoise',
               :location =>'Shop',
               :theme => 'Polar',
               :timescale => '3 days')

Challenger.create(:title =>'When Line Dancing goes Bad!',
               :caption =>
                   %{Well, on the upside.},
               :homage_url =>'koons3.jpg',
               :colour => 'Grey',
               :location =>'Office',
               :theme => 'Jungle',
               :timescale => '4 days')

Challenger.create(:title =>'Spelling',
               :caption =>
                   %{Be kind, rewind.},
               :homage_url =>'koons4.jpg',
               :colour => 'Ash',
               :location =>'River',
               :theme => 'Australian',
               :timescale => '5 days')

Challenger.create(:title =>'Windows',
               :caption =>
                   %{We always get strung along.},
               :homage_url =>'koons5.jpg',
               :colour => 'Pink',
               :location =>'Canal',
               :theme => 'Brazilian',
               :timescale => '6 days')

Challenger.create(:title =>'Fools',
               :caption =>
                   %{Mind the trap.},
               :homage_url =>'koons6.jpg',
               :colour => 'Banana Yellow',
               :location =>'Sea',
               :theme => 'Chinese',
               :timescale => '7 days')

Challenger.create(:title =>'Teachers',
               :caption =>
                   %{Let's stick together and nobody will get lost},
               :homage_url =>'koons7.jpg',
               :colour => 'Primrose Yellow',
               :location =>'Beach',
               :theme => 'Japanese',
               :timescale => '1 week')

Challenger.create(:title =>'School',
               :caption =>
                   %{Three legged races are so not a challenge.},
               :homage_url =>'lichenstein1.jpg',
               :colour => 'Lime',
               :location =>'Street',
               :theme => 'African',
               :timescale => '2 weeks')

Challenger.create(:title =>'Circus',
               :caption =>
                   %{Yes, I'm rather tied up at the moment.},
               :homage_url =>'lichenstein2.jpg',
               :colour => 'Blonde',
               :location =>'Alley',
               :theme => 'Pop',
               :timescale => '3 weeks')

Challenger.create(:title =>'Cinema',
               :caption =>
                   %{Sticky situation, I'm afraid.},
               :homage_url =>'monet1.jpg',
               :colour => 'Silver',
               :location =>'Theatre',
               :theme => 'Arty',
               :timescale => '1 month')

Challenger.create(:title =>'Markers and Pens',
               :caption =>
                   %{Throwing caution to the wind.},
               :homage_url =>'monet2.jpg',
               :colour => 'Gold',
               :location =>'Cinema',
               :theme => 'Black and White',
               :timescale => '1 minute')

Challenger.create(:title =>'Giant Rubber',
               :caption =>
                   %{No, you don't look mad enough, Next!},
               :homage_url =>'monet3.jpg',
               :colour => 'Bone',
               :location =>'School',
               :theme => 'Blurred',
               :timescale => '40 minutes')

Challenger.create(:title =>'Life',
               :caption =>
                   %{May we interest you in double glazing?},
               :homage_url =>'munch1.jpg',
               :colour => 'Bottle Green',
               :location =>'Concert Hall',
               :theme => 'High Contrast',
               :timescale => '5 minutes')

Challenger.create(:title =>'Babies',
               :caption =>
                   %{Just another day in French cinema...},
               :homage_url =>'monet4.jpg',
               :colour => 'Mailbox Red',
               :location =>'Garden',
               :theme => 'Driving',
               :timescale => '30 minutes')

Challenger.create(:title =>'Grannies',
               :caption =>
                   %{Exactly two thousand words.},
               :homage_url =>'picasso2.jpg',
               :colour => 'Lavender',
               :location =>'Meadow',
               :theme => 'Monotone',
               :timescale => '10 minutes')

Challenger.create(:title =>'Busstop',
               :caption =>
                   %{What's for dessert?},
               :homage_url =>'picasso3.jpg',
               :colour => 'Sienna',
               :location =>'Playground',
               :theme => 'Duotone',
               :timescale => '19 minutes')

Challenger.create(:title =>'Television',
               :caption =>
                   %{Sorry, gotta go. Must fly.},
               :homage_url =>'picasso4.jpg',
               :colour => 'Umber',
               :location =>'School',
               :theme => 'Broken',
               :timescale => '15 minutes')

Challenger.create(:title =>'World Wide Web',
               :caption =>
                   %{Is it art? Is it art? },
               :homage_url =>'picasso5.jpg',
               :colour => 'Burnt Umber',
               :location =>'Cafe',
               :theme => 'Love',
               :timescale => '60 minutes')

Challenger.create(:title =>'Traffic Jam',
               :caption =>
                   %{Tastes like frozen chicken},
               :homage_url =>'pollock1.jpg',
               :colour => 'Burnt Sienna',
               :location =>'Bistro',
               :theme => 'Giving',
               :timescale => '1 hour')

Challenger.create(:title =>'Cycling',
               :caption =>
                   %{My head goes all the way to the top of my hat too.},
               :homage_url =>'seuret1.jpg',
               :colour => 'Coffee',
               :location =>'Restaurant',
               :theme => 'Tiresome',
               :timescale => '2 hours')

Challenger.create(:title =>'Sugar',
               :caption =>
                   %{OK, perhaps the new perfume is a bit overpowering},
               :homage_url =>'vangogh1.jpg',
               :colour => 'Cerise',
               :location =>'Boat',
               :theme => 'Miserable',
               :timescale => '3 hours')

Challenger.create(:title =>'Sweets',
               :caption =>
                   %{Paperwork. No end to the paperwork.},
               :homage_url =>'vangogh2.jpg',
               :colour => 'Charcoal',
               :location =>'Ship',
               :theme => 'Entertaining',
               :timescale => '4 hours')

Challenger.create(:title =>'Hospital',
               :caption =>
                   %{Coffee runs out at the office.},
               :homage_url =>'vangogh3.jpg',
               :colour => 'Cherry',
               :location =>'Harbour',
               :theme => 'Historical',
               :timescale => '5 hours')

Challenger.create(:title =>'Doctor',
               :caption =>
                   %{If any one asks, you ate my report.},
               :homage_url =>'warhol1.jpg',
               :colour => 'Copper',
               :location =>'Industrial Estate',
               :theme => 'Statistically',
               :timescale => '6 hours')

Challenger.create(:title =>'Nurses',
               :caption =>
                   %{I've got a signal!},
               :homage_url =>'warhol2.jpg',
               :colour => 'Bronze',
               :location =>'Apartment',
               :theme => 'Data',
               :timescale => '7 hours')

Challenger.create(:title =>'Mystery',
               :caption =>
                   %{I keep getting this feeling of deja vu},
               :homage_url =>'warhol3.jpg',
               :colour => 'Cyan',
               :location =>'Bedsit',
               :theme => 'Speed',
               :timescale => '10 hours')

Challenger.create(:title =>'Creepy',
               :caption =>
                   %{Don't let the cat out of the bag!},
               :homage_url =>'warhol4.jpg',
               :colour => 'Magenta',
               :location =>'House',
               :theme => 'Biggest Ever!',
               :timescale => '12 hours')

Challenger.create(:title =>'Tired',
               :caption =>
                   %{I am just going outside and may be some time.},
               :homage_url =>'warhol5.jpg',
               :colour => 'Raspberry',
               :location =>'Garage',
               :theme => 'Smallest Ever!',
               :timescale => '1 day')

Challenger.create(:title =>'Bored',
               :caption =>
                   %{High Water everywhere!},
               :homage_url =>'wave.jpg',
               :colour => 'Salmon Pink',
               :location =>'Attic',
               :theme => 'Longest Ever!',
               :timescale => '1 year')

Challenger.create(:title =>'Ecstatic',
               :caption =>
                   %{No one could tell us how to get to Sesame Street, actually.},
               :homage_url =>'zombunnies.jpg',
               :colour => 'Pastel Blue',
               :location =>'Path',
               :theme => 'Nature',
               :timescale => '1 decade')

Challenger.create(:title =>'Gloomy',
               :caption =>
                   %{So, we're here, and all our luggage is on Saturn?},
               :homage_url =>'mondrian1.jpg',
               :colour => 'Pastel Yellow',
               :location =>'Carpark',
               :theme => 'Zombies',
               :timescale => '1 century')

Challenger.create(:title =>'Time',
               :caption =>
                   %{I love Wrong Art!},
               :homage_url =>'mondrian2.jpg',
               :colour => 'Ebony',
               :location =>'Shop',
               :theme => 'Holiday',
               :timescale => '1 millenia')