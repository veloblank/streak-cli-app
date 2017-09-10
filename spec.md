# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
  The overall goal of this project was to create a CLI combined with a scraper and other Ruby classes. I believe I have achieved this goal with the app in its current form. It does not dig too deeply into other web resources (primarily the http://streak.espn.com/en/ site), but it does have a robust CLI for the app user to navigate, and has room for improvement and updates.

- [x] Pull data from an external source
  My CLI project pulls data from an ESPN contest webpage. The Scraper and Prop classes rebuild the props that the CLI displays for the user to read, select and store, and even make picks through the CLI and the Launchy gem.

- [x] Implement both list and detail views
  The project presents a list of sports props that the user can choose from to detail the individual props and make a selection that launches the browser and makes the pick back on ESPN's contest page.
