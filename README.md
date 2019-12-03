# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [ ] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [ ] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthough GIF

<img src="https://imgur.com/OaFuqv3.gif" width=250><br>

### Notes
A major challenge that I came across was during the Collection View Setup, where the images of each movie poster loaded in a tiny square (image below). I found a solution in [stack overflow](https://stackoverflow.com/questions/56840665/why-on-xcode-11-uicollectionviewcell-changes-size-as-soon-as-you-scroll-i-alre) that led me to set the "Estimate Size" parameter for the Collection View to "None".

![Collection View tiny images issue](https://imgur.com/X9hja2B.png)

---

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.

### App Walkthough GIF

<img src="https://imgur.com/49aeJYQ.gif" width=250><br>

## App Walkthrough on live iPhone XR

+<img src="/flixster_real_iphone_xr-min.gif?raw=true" width="250px">

### Notes
Some of the challenges faced during the app creation were all related to using Storyboard and getting Autolayout to align properly when building between the iPhone 8 and iPhone 11.
