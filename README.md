# Overwatch

![](http://i.imgur.com/TzZdX4x.png?1)

[Overwatch](https://en.wikipedia.org/wiki/Overwatch_(video_game)) is a team-based multiplayer first-person shooter video game developed and published by Blizzard Entertainment. It was released in May 2016 for Microsoft Windows, PlayStation 4, and Xbox One.

# What you will be building

Click the image below to play the demo on YouTube.

[![](http://img.youtube.com/vi/Z3_K6sbW0NU/0.jpg)](https://www.youtube.com/watch?v=Z3_K6sbW0NU "Overwatch App Demo")


# Quick Summary

We will be building out multiples structs, protocols, extensions along with multiples elements from UIKit to create a simple app that will be able to display multiples heroes from Overwatch. Here hero will have various attributes that will display in the center of the screen when they are selected.

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

---

Create an `OverwatchHero.swift` file.

Near the top of the file, below where you see `import Foundation`, I would like for you to type in the following code:  

```swift
typealias Health = Int
```

This associates the word `Health` with the type `Int`. It's as if we created a type which is an exact replica of the type `Int`. We can now go across our code typing `Health` wherever we mean to type and use the `Int` type. You shouldn't abuse this and only look to do this when it makes the most sense. I'm sort of forcing the issue here, having you do in this lab. I'm doing it more-so so you can see that it can be done.

Create a protocol named `Weapon`. This protocol should require any conforming type to have the following:
* An instance method called `fire` which returns a `String` value whenever it is called.
* An instance method called `heal` which returns a `String` value whenever it is called. 

Create another protocol called `OverwatchHero` which adopts two protocols of its own. `OverwatchHero` should adopt the following protocols:  
* Weapon
* CustomStringConvertible

Remember, you can adopt multiple protocols on a type separated by a comma.

This protocol should require any conforming type to have the following:
* An instance property named `name` of type `HeroName` that is both gettable and settable.
* An instance property named `hitPoints` of type `Health` that is both gettable and settable.
* An instance property named `heroType` of type `HeroType` that is gettable.
* An instance method called `produceHeroType` which returns a `HeroType` value whenever it is called.
* An instance method called `produceInitialHitPoints` which returns a `Health` value whenever it is called.

By now, you should notice two things. The `OverwatchHero` protocol adopted the `Weapon` and `CustomStringConvertible` protocols, but we never conformed to them. We will be doing that shortly using extensions.

Create an extension on the `OverwatchHero` protocol. Within the scope of that extension, you should conform to the `Weapon` protocol by implementing the `fire()` and `heal()` instance methods.

Within your implementation of the `fire()` method, you should switch on the `heroType` (which is available to any instance which adopts and conforms to the `OverwatchHero` protocol. How do I know that? If you adopt/conform to this protocol, you _must_ then provide an instance property named `heroType` of type `HeroType`--which is why it's available for us to use within the scope of this function).

When switching on the `heroType`, you should return back a `String` based upon the following cases:
* `offense` should return "Role: 👊🏽"
* `defense` should return "Role: ✋🏽"
* `support` should return "Role: 👐🏽"
* `tank` should return "Role: ✊🏽"

Within your implementation of the `heal()` method, you should switch on the `heroType` instance property. You should return back a `String` based upon the following cases:
* `offense` should return "Heal: ✖️"
* `defense` should return "Heal: ✖️"
* `support` should return "Heal: ❤️"
* `tank` should return "Heal: ✖️"




