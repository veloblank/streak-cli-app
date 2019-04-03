# Streak-cli-app
This is a public repository of my Flatiron School CLI-controlled scraper project.

DailyStreak

Welcome to my DailyStreak CLI gem project!

The application can be launched with ruby bin/DailyStreak in the project folder.

In order for the app to properly work, the user needs to be logged into an ESPN account, or there could be potential problems launching picks after scraping. A video walk-through accompanies this project for the Flatiron School.

Currently this application is not a publicly available gem. Because it has the potential to violate the Terms of Service of ESPN's fantasy contest, Streak for the Cash, I will not make this a public gem. While it's current form may not violate the TOS, because picks can eventually be automated, it would violate the TOS regarding botting/automation in order to gain an advantage over other contest participants. In the app's current form I think this is a gray area now. It is primarily a scraper that reconstitutes the props into a CLI where the picks can be made, without giving an advantage over other contestants, similar to an app (the official Streak for the Cash app) on a phone, where contestants can make picks away from a computer, but are not automated.

Future Development

My final design is fairly consistent with my original thinking. The app is primarily a scraper that delivers the 'props' of a fantasy contest to the user, where they can read matchup previews and make picks, one at a time.

For future development I would like to work with a database where the picks could be persisted and manipulated/changed by the user. I also would like to use a list of props that persists until the day changes, when the table of props would drop/delete, and the new props for the next day could be scraped and persisted.

The list would make automating picks easy. The user would choose when to launch the picks, taking into account the length of the games/props so the next pick could be made after the previous prop is graded/finished.

Continuing development of this project would eventually lead to automating/botting picks. Because I enjoy the contest, I will continue to make picks in the traditional way, but develop this app for educational purposes and limit its use in making picks.

Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/veloblank/streak-cli-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

License

While not yet a Ruby gem, the codebase is available as open source software under the terms of the MIT License. Please consider me as a willing participant in future developments of the project. It has served its purpose as a CLI project, but its impact can be much greater. 
