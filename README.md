# Rails 5 API
Requirements:

* Rails 5 / Ruby v 2.3.1

# Introduction

	This is a Rails 5 API only app.  There are some tests written for users and items


# Basic Instructions

* Run a Rails Server and visit localhost:3000 in the browser


# Making Requests

There is a user with token system for item CRUD operations, but there is no login requirement to make API requests.

To List all items:

* localhost:3000/items
* Returns JSON:API data items index showing categories, user, status relations

Details of one item:

* localhost:3000/items/:item id
* Item id: There are 50 items seeded in the database
* Banned item info is restricted by item controller

A users sold items:

* localhost:3000/items/:user id/:status id
* User id: There are 5 users seeded in the database
* Status id: 1 for 'Available', 2 for 'Sold', 3 is 'Banned'


# Run tests

* Run $ Rails t


Location of tests:

* /test/controllers/


23/August/2016