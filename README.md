# Project_2 Create DB with CRUD routes in nodeJS

### Option 1
I play a mobile game called Star Wars Galaxy of Heroes.  The game has an api from which I can absorb and use in my DB.  
The idea would be to query my account, see my players I have invested, mods, etc.  I can then correlate my account to others or see what I need to gain new characters being offered.  

For example, let say the game is going to introduce Jedi Knight Luke Skywalker next week giving me 7 days to prepare.  The requirements to obtain him may require a 7 star R2D2, Leia, Chewie, Han Solo and C3PO.  I may only have R2D2 at 5 stars and I do not have C3PO yet.  What would I have to do or how much would it cost me to obtain the characters I need to unlock JK Luke Skywalker?  

Mods are another thing.  There are like over 1000 modes per each account.  It is hard to track in game on a small screen.  Perhaps I can do a sweep and recommend player upgrade mod X.  
(https://swgoh.gg/api/ "SWGOH.GG API Site")

### Option 2
I like Superheroes DC or Marvel.  There is a website API that I can query data and use in my DB.  I guess I would make it more like a wiki page or a query page that can list which heroes  are the stongest, which ones are bad/good (alignment), etc.  Be more of an informational page. 
(https://superheroapi.com/index.html "SuperHeroes API")

# Which DB to use
I am not sure which DB I would use at this time.  I do not want to make RDBS and end up with a ton of tables in order to implement the realtionships.  That can get unwieldy and lost quickly.  I would want to limit my tables to like 10 or less if I did a RDBS.  I would use Mongo because a lot of these are going to a many-to-many data type relationships.  For example, hulk is going to have many strengths and weakness.  Hulk may have different names (aliases ) he used to disguise himself.  Same goes with the Star Wars Game above.  Using a RBDS would require a ton of tables and then I would have to query an ID to dive into another table to find X crossed into another table.  

I would probably lean on using an RDBS if I can organize the tables well.  Will need to investigate!!!

Just for a reference -- The star wars 3rd party API I believe uses MongoDB.  The super heroes one I beleive also uses MongoDB.  I would probab  
