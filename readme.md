# ActivityFeed

## 1. Project assumptions
1. Project will follow Clean Architecture principles
2. `Storyboards` and `xib`s will not be used, all views will be written from code
3. `cocoapods` used as depencency management system (includng them in repo is arguable as I decided to do)

NOTE: Clean Architecture is overkill for such project, wanted to showcase what I am currently into.

## 2. Clean architecture
This project is written with Clean Architecture principles I am really into. Here are some links about general concept of it to those unfamiliar :
* [Uncle Bob's original talk on Clean Architecture](https://www.youtube.com/watch?v=Nsjsiz2A9mg)
* [Jorge Ortiz presentation on Clean Architecture](http://www.slideshare.net/jorgedortiz/clean-architecture-workshop)
* [Author's blogpost on workshops at Tooploox](http://blog.tooploox.com/clean-architecture-workshops-ios/)

As I am really architecture focused programmer I am always happy to discuss such topics and would love to hear your opinion on it.

## 3. Would improve
1. Clean up code
2. Add more tests
3. Fix failing test due to date formatting `ActivityTests -> testFromValidJson()`
4. Handle errors
5. Add activity indicators
6. Beautify - animations, tweaks, etc.
