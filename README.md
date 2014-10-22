Sinatra
=============

Brought to you by Lighthouse Labs

## Getting Started

1. `bundle install`
2. `shotgun -p 3000 -o 0.0.0.0`
3. Visit `http://localhost:3000/` in your browser

=======================
### Description

An app where users can post Activities and search for other Activities based on a set of pre-defined parameters and tags. Activities are centered around a geographic location (currently, city). Users can rate and comment others' Activities; an Activity's rating affects its search ranking. Users accumulate Influence based on the aggregate rating of their Activities.

### User Stories

* Anyone can create a User account      
* Anyone can search for and view Activities by tags and parameters      
* Anyone can see all Activities a particular User has posted and their associated Reviews (ratings and comments)      
* As a User, I can post an Activity     
* As a User, I have to specify pre-defined tags and parameters for my Activity      
* As a User, I can delete my own Activities (losing Influence)      
* As a User, I can gain Influence from ratings on my Activities     
* As a User, I can Review other users' Activities       

============================

### Nouns (Data, Objects)

** User **
* username: String
* password: 
* avatar: binary

** Methods **
* influence - returns aggregated influence
* highlight - returns bronze, silver, or gold depending on aggregated influence


** Activity **
* title: String
* outdoor: boolean
* social: boolean
* cost: Int [0,1,2,3]
* city: String
* content: String

** Review **
* rating: Int
* comment: String

** Tag **
* name: String

============================

### Routes
/users
/users/new
/users/:id -- see my Influence and other profile details
/users/:id/activities
/users/:id/activities/new
/users/:id/activities/:id
/users/:id/activities/:id/delete
/users/:id/activities/:id/reviews/
/users/:id/activities/:id/reviews/new
/users/:id/activities/:id/tags/new

/tags --> search for activities by tags and parameters
/tags/:id/activities
/tags/parameter(s)/activities

'/' includes  '/activities', '/users/new', '/users/:id/activities/new'?

============================



### Future TODOs

#### Google Maps API
#### Weather API
#### Create Gallery object that belongs_to Activity
#### Phone check in?

