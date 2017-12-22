# NightmAirbnb

[Introduction](#Introduction) | [Approach](#Approach) | [Challenges](#Challenges) | [Tech Stack](#Tech Stack) | [User Stories](#User Stories)

## Introduction

NightmAirbnb is an implementation of Makers Academy's Week 6 challenge, MakersBnB, the full spec for which can be found [here](https://github.com/makersacademy/course/tree/master/makersbnb). In short, the challenge was to build a clone of as much as possible of Airbnb in a week. [User stories](#user stories) that were succesfully implemented are listed below. The latest deployed version of NightmAirbnb can be found at https://nightmairbnb.herokuapp.com/.


## Approach

We began this task by establishing what our minimum viable product (MVP) would be. This is represented by our first four [user stories](#user stories), allowing a user to either list or book a space. From a systems design perspective, we used Class/Responsibility/Collaborator (CRC) cards to map out what models we would need, and how each model would communicate with any other models.


## Challenges

NightmAirbnb was the first challenge that we had worked on as part of a team. As such, it involved a learning curve in using git beyond sicouldmply pulling and pushing: creating branches, merging branches, resolving conflicts (and then, inevitably fixing bugs after it turned out we hadn't resolved conflicts properly...) etc. This also entailed learning how best to parallelise work, as we pursued a series of user stories that were often dependent upon one feature being completed in order to work on the next. This led at times to work stalling, and these bottlenecks could have been avoided had we pursued non-interdependent feature sets, rather than focusing broadly on a single path.


## Tech Stack
NightmAirbnb was built using the following technologies:
- HTML
- CSS
- jQuery
- Sinatra
- Postgres
- DataMapper
- Git


## User Stories

User stories are listed below in the order they were implemented.

```
As a user
So that I can list or book a space
I want to choose to be a host or a guest

As a host
So I can make money from my spare room
I want to be able to list a space

As a guest
So I can see places to stay
I want to see all available spaces

As a guest
So that I can stay somewhere
I want to book a space

As a guest
So I don't waste my time
I want to see which spaces are already booked

As a system administrator
So that I keep track of bookings
I would like them to be stored in a database

As a host
So I can better advertise my space
I want to upload links to pictures of my space

As a user
So I can rent or list my own space
I want to sign up

As a user
So other people can't alter my account
I want to sign out

As a user
So I can access my bookings and listings
I want to sign in

As a system adminstrator
So that I can ensure guest safety
I would liket to ensure that only registered users can add a space

As a system adminstrator
So that I know who to notify when a booking is created
I would like to ensure that only registered users can make a booking

As a user
So that I can access all my information from nightmAirbnb easily,
I would like to see all of my bookings and sapces information on one page.

As a host,
So that I can get multiple booking requests
I would like to make my space available again.
```

NightmAirbnb was created by [Allan](https://github.com/cazwazacz), [Antonio](https://github.com/antoniobelmar), [Gabriela](https://github.com/gabrielabud) and [Peter](https://github.com/peterwdj).
