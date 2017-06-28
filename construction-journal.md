For my CLI-controlled scraper project, I chose to scrape a favorite site of mine: ESPN's Streak for the Cash (SFTC). It's considered a fantasy sports contest by ESPN, but it's not a conventional fantasy sport. In a nutshell, a user selects winners of sporting events that the site offers up on a daily basis. The user can only choose one matchup at a time. When the event is finished, the user will have a winning streak or a losing streak of based on whether his selection won or lost. To keep the game fun, sometimes the Streakmaster throws in other events, such as: "Will Punxatawney Phil see his shadow?". This has evolved the sports matchups, and for the purposes of the project and blog, will be called "props". In any case, each prop only has 2 outcomes, but sometimes a "push", which does not affect the user's streak, but may have a few times/month because of sporting events affected by weather, etc.

To win at SFTC, a user must either achieve the highest winning streak of all users for the month, or, achieve the most amount of total wins for the month of all users. There is a cash prize each month.

  General/Specifics:
    1. There is a daily streak board of props.
    2. There are 15-40 props each day.
    3. Each prop has some attributes:
        a. it has a specific 'event' title
          *ATP Antalya - 2nd Rd (Antalya, Turkey): Who will WIN this matchup?
        b. it is a specific sport
          *Tennis
        c. it has a specific start time
          *11:00 AM
        d. it has 2 opponents, or two outcomes, one of which is the winner and the other the loser
          *David Ferrer
          *Yuichi Sugita
        e. a preview link which redirects to an ESPN matchup preview, or another website that previews the matchup
        f. a percentage of ESPN SFTC users who are picking one side over the other
            - and similarly a "Hot" index which indicates the number of users who are picking the prop.
        g. there is also a "check-box" for selecting your side.
            - when clicked, or copied and pasted into the address bar, the user's pick is made.
            
I am assuming a project like this falls into a gray area of the ESPN contest's Terms of Service or is outright a bannable offense. The TOS expressly prohibits bots and automated picks. While it's not the goal of this project from the outset to create a bot or automate picks beyond the scope of educating about scraping HTML elements, it would be very easy to implement a bot and distribute a Gem to make selections at certain times, forfeit games that have insurmountable scores, and make other selections to gain an advantage over human operators of the game. Historically, monthly winners have 25+ prop winning streaks (W25+) and over 120 total wins for the month. I am expressly stating here that while I will keep this as a side project after my assessment and continue to implement future changes to the project, I will not use it for "botting" my picks in order to gain an advantage, and I will look into creating a Gem, but not publish it, but will instead supplement my sportsbetting habit with it! Screw the bookies.

As it relates to a CLI-controlled, object-oriented Ruby project, I have several first impressions:
       1. There is a daily "board" of props available by each morning. Other props are rarely added after the board is 
          published. It is available in a single web page, with a simple URL.
            This page reminds me of a "front page" of a newspaper. It has many props/stories...
       2. The props have many attributes.
       3. I will probably start with an INSIDE-OUT approach to coding this project.
       4. The CLI could get "involved", but the early grunt work of getting all the attributes to point to the correct props           is going to be the best use of my time. After variables and classes and URLs are sorted, a CLI will bring all of 
          these together in a manageable way.
       5. I will probably experiment with making a pick through the CLI as my "stretch" programming goal for the project.
          Because a pick can be made just by launching a URL, this should be quite easy.
          
          Good luck to me!


            
