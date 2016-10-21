# Overwatch

![](http://i.imgur.com/TzZdX4x.png?1)

[Overwatch](https://en.wikipedia.org/wiki/Overwatch_(video_game)) is a team-based multiplayer first-person shooter video game developed and published by Blizzard Entertainment. It was released in May 2016 for Microsoft Windows, PlayStation 4, and Xbox One.

Trailer (fan-made):

[![](http://img.youtube.com/vi/mLPkdWfOxi0/0.jpg)](https://www.youtube.com/watch?v=mLPkdWfOxi0 "Overwatch Trailer")




# Quick Summary

We will be building out multiples structs, protocols, extensions along with multiples elements from UIKit to create a simple iOS app.

# Instructions

Create a new `HeroAttributes.swift` file.  

In that `.swift` file, create an enum called `HeroName`. This enum should adopt the `CustomStringConvertible` protocol. When a type adopts a protocol, it must then conform to it. To conform to the `CustomStringConvertible`, you must provide (within your implementation of the `HeroName` enum) a read-only computed property called `description` of type `String`. Shortly, we will cover exactly how you will implement this read-only computed property.  

The various cases of this `HeroName` enum should be as follows:  
* genji
* mcCree
* pharah
* reaper
* soldier76
* tracer
* bastion
* hanzo
* junkrat
* mei
* torbjörn
* widowmaker
* dva
* reinhardt
* roadhog
* winston
* zarya
* ana
* lúcio
* mercy
* symmetra
* zenyatta

Conform to the `CustomStringConvertible` protocol by implementing the read-only computed property called `description` of type `String`. In your implementation, you should switch on `self` and for each possible case, you should provide a simple `String` representation. This means mostly capitalizing the first letter of the case. For example, 

```swift
case .genji: return "Genji"
```    

---

Still in the same `.swift` file, create another enum called `HeroType` which adopts the `CustomStringConvertible` protocol.  

The cases of this enum are as follows:  
* offense
* defense
* support
* tank

Conform to the `CustomStringConvertible` protocol by implementing the read-only computed property named `description` of type `String`. In your implementation, you should switch on `self`--each case should return a unique `String`. See the following chart:  
* `offense` should return back "💥"
* `defense` should return back "🛡"
* `support` should return back "🚑"
* `tank` should return back "🐼"

On the `HeroType`, create a static read-only computed property called `allTypes` of type [`HeroType`]. It should return back the following array: [`.offense`, `.defense`, `.tank`, `.support`]

---

Head back up to the `HeroName` enum you created above. We will be creating a function.

This function should be a static function (meaning, it can only be called by the type itself and not on an instance of that particular type). The name of this static function should be `heroes(with:)` where it takes in one argument called `type` of type `HeroType`. The return type should be [`HeroName`].

In your implementation of this function you should switch on `type` (the parameter name) and for each case you should return back the following:

* `.offense` should return `[.genji, .mcCree, .pharah, .reaper, .soldier76, .tracer]`
* `.defense` should return `[.bastion, .hanzo, .junkrat, .mei, .torbjörn, .widowmaker]`
* `.tank` should return `[.dva, .reinhardt, .roadhog, .winston, .zarya]`
* `.support` should return `[.ana, .lúcio, .mercy, .symmetra, .zenyatta]`


---

Create an `OverwatchHero.swift` file.

Near the top of the file, below where you see `import Foundation`, I would like for you to type in the following code:  

```swift
typealias Health = Int
```

This associates the word `Health` with the type `Int`. It's as if we created a type which is an exact replica of the type `Int`. We can now go across our code typing `Health` wherever we mean to type and use the `Int` type.

Create a protocol named `Weapon`. This protocol should require any conforming type to have the following:
* An instance method called `fire` which returns a `String` value whenever it is called.
* An instance method called `heal` which returns a `String` value whenever it is called. 

Create another protocol called `OverwatchHero` which adopts two protocols of its own. `OverwatchHero` should adopt the following protocols:  
* Weapon
* CustomStringConvertible

Remember, you can adopt multiple protocols on a type separated by a comma.

This `OverwatchHero` protocol should require any conforming type to have the following:
* An instance property named `name` of type `HeroName` that is both gettable and settable.
* An instance property named `hitPoints` of type `Health` that is both gettable and settable.
* An instance property named `heroType` of type `HeroType` that is gettable.
* An instance method called `produceHeroType` which returns a `HeroType` value whenever it is called.
* An instance method called `produceInitialHitPoints` which returns a `Health` value whenever it is called.

By now, you should notice two things. The `OverwatchHero` protocol adopted the `Weapon` and `CustomStringConvertible` protocols, but we never conformed to them. We will be doing that shortly using extensions.

Create an extension on the `OverwatchHero` protocol. Within the scope of that extension, you should conform to the `Weapon` protocol by implementing the `fire()` and `heal()` instance methods.

Within your implementation of the `fire()` method, you should switch on the `heroType` (which is available to any instance which adopts and conforms to the `OverwatchHero` protocol. How do I know that? If you adopt/conform to this protocol, you _must_ then provide an instance property named `heroType` of type `HeroType`--which is why it's available for us to use within the scope of this function).

When switching on the `heroType`, you should return back a `String` based upon the following cases:
* `offense` should return "Offense: 👊🏽"
* `defense` should return "Defense: ✋🏽"
* `support` should return "Support: 👐🏽"
* `tank` should return "Tank: ✊🏽"

Within your implementation of the `heal()` method, you should switch on the `heroType` instance property. You should return back a `String` based upon the following cases:
* `offense` should return "Heal: ✖️"
* `defense` should return "Heal: ✖️"
* `support` should return "Heal: ❤️"
* `tank` should return "Heal: ✖️"

Create another extension on the `OverwatchHero` protocol. Within this extension we will be implementing the `produceHeroType` and `produceInitialHitPoints` functions. By doing this, we're providing a default implementation. Any type which adopts/conforms to the `OverwatchHero` protocol will have these two methods available to them (for free!).

Within the `produceHeroType` function you should switch on the `name` stored property (which is available to any instance of the particular type which adopts/conforms to the `OverwatchHero`. This is why we're able to utilize it within the scope of this function). You should be returning back a `HeroType` value based upon the various cases. To see what case belongs to what `HeroType`, use the chart below:

![](https://s3.amazonaws.com/learn-verified/OWLabPhoto.png)

In your implementation of the `produceInitialHitPoints` function you should switch on the `heroType` instance property. You should return back a `Health` value based upon the following:
* If the `heroType` is `.offense`, we should return 250
* If the `heroType` is `.defense`, we should return 250
* If the `heroType` is `.support`, we should return 150
* If the `heroType` is `.tank`, we should return 500

Create _one_ more extension on the `OverwatchHero` protocol. Within this extension you should provide a read-only computed property called `description` of type `String`.

The `String` value you return should be like the following:
```
Name: Genji
Type: Offense: 💥
Attack: Offense: 👊🏽
Heal: Heal: ✖️
Hit Points: 250
```

You shouldn't copy that verbatim as I'm not looking for you to return that _exact_ `String`. It should be formatted to fit the current instance. (Hint: Meaning, instead of writing Genji, use the `name` stored property instead.)

---

Create a new `Hero.swift` file.

In this file you should create a new struct called `Hero`. This type should adopt the `OverwatchHero` protocol.

This type should have the following instance properties:
* An instance property named `name` of type `HeroName`
* An instance property named `hitPoints` of type `Health` with a default value of 0
* A read-only computed property called `heroType` of type `HeroType`. It should return _the_ return value from a call to the `produceHeroType()` method it has available to it. Since the `OverwatchHero` protocol provided a default implementation to the `produceHeroType()` function, `Hero` gets this function for free. We can call on this `produceHeroType()` function anywhere in our `Hero` type. Here we're doing it within a read-only computed property and immediately returning the value.

Create an `init` function that has one argument. Its only argument is called `name` of type `HeroName`. In your implementation of this `init` function, you should assign the `name` value passed in to the instances `name` stored property. After doing that.. we're going to be assigning a new value (since we provided it with a default value of 0) to the `hitPoints` stored property. You should call on the `produceInitialHitPoints()` method here and its return value should be assigned to the `hitPoints` stored property.

Implement (not by copy/pasting as I've made it an image) the following two methods in your `Hero` struct.

![](https://s3.amazonaws.com/learn-verified/OWCode.png)

Scroll back up to the top of your struct. Lets make two more read-only computed properties.

The first should be named `image` of type `UIImage`. You should call on the `produceButtonImage()` function here and return that value.

The second read-only computed property should be called `profileImage` of type `UIImage` and it should return the value returned by a call to the `produceProfileImage()` method.

---

Create a `Game.swift` file.

In this file, you should create a `Game` struct. In your implementation of this struct, it should have the following stored properties (all variables):
* `offenseCharacters` of type [`Hero`], assigning an empty array as its default value.
* `defenseCharacters` of type [`Hero`], assigning an empty array as its default value.
* `supportCharacters` of type [`Hero`], assigning an empty array as its default value.
* `tankCharacters` of type [`Hero`], assigning an empty array as its default value.
* `heroType` of type `HeroType` with a default value of `.offense`

Next you should create an extension on the `Game` struct and provide the following function.

The function you should implement in the extension should be called `createAllHeroes()`. It takes in no arguments and returns nothing. It should also be marked as `mutating` because in your implementation, we will be mutating stored properties on `self`.

Ultimately this function needs to create instances of every single character.

Here's the tools you have available to you (tools that you implemented above).

`HeroType.alltypes` should return back to you an array of all the types of heroes.

`HeroName.heroes(with:)` takes in as an argument an instance of type `HeroType` which will return back an array of all the hero names of type `HeroName` for that particular `HeroType`.

In creating an instance of `Hero`, it takes in as an argument through its initializer an instance of `HeroName`.

You should create every hero (instances of `Hero`) and after creating them, appending them to the correct array.

The arrays we have to work with on this type are `offenseCharacters`, `defenseCharacters`, `tankCharacters` and `supportCharacters` so make sure you're appending the `Hero` instance to the correct array based upon their type.

After you're done implementing this function. Create an `init()` function. In that `init()` function you should call on the `createAllHeroes()` function you just implemented.

Now you should create another function called `heroesForType()` which takes in no arguments and returns back [`Hero`]. In your implementation of this function you should switch on `heroType` (the stored property available to `self`) and for each case return the appropriate array. If the case is `.offense` you should return `offenseCharacters` and so on.

After implementing this function, head back up to the top of the fle and create a read-only computed property called `heroes` of type [`Hero`]. It should call on the `heroesForType()` function you just implemented and return the value returned by a call to that function.

# This concludes Part I

# Part II has you implementing the UI.