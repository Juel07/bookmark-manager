## Bookmark Manager

Built a database backed web application, to store user's favourite links.

- Sinatra
- PostgreSQL
- RSpec (unit testing)
- Capybara (feature testing)
- TablePlus (Database GUI)

### Screenshots

<img src = "/screenshots/bookmarks.png" width = "70%">

<img src = "/screenshots/add-bookmark.png" width = "70%">

<img src = "/screenshots/edit-bookmark.png" width = "70%">

## How to

### Set up the project

Clone this repository and install all the dependencies by running:

```
bundle install
```

To set up the databases, connect to psql:

```
psql
```

Create the `bookmark_manager` and `bookmark_manager_test` databases:

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

Connect to each database:
```
\c bookmark_manager;
\c bookmark_manager_test;
```
To create the tables, run the SQL queries in the `db/migrations` folder in the given order.

### Run the Bookmark Manager app

- run ``` ruby app.rb ```
- Visit http://localhost:4567/


## Intended Features

- Show a list of bookmarks ✅
- Add new bookmarks ✅
- Delete bookmarks ✅
- Update bookmarks ✅
- Comment on bookmarks 🚧
- Tag bookmarks into categories 🚧
- Filter bookmarks by tag 🚧
- Users are restricted to manage only their own bookmarks 🚧

## User Stories

```
As a user,
So that I may easily access my most frequented resources
I would like to show a list of my bookmarks
```
```
As a user,
So that I may add resources to my list
I would like to be able to add a new bookmark
```
```
As a user,
So that I may declutter my list
I would like to delete a bookmark
```
```
As a user,
So that I may change or edit my bookmarks
I would like to update a bookmark
```

## Domain Model

Nouns
- bookmark

Verbs
- show
- add
- delete
- update

### MVC
[MVC Sequence Diagram](/images/User-Story-2_MVC.jpeg)

```
User->>+Browser: requests `bookmarks`
Browser->>+Controller: GET /bookmarks
Controller->>+Model: bookmark_list
Model->>-Controller: bookmark_list array
Controller->>+View: render :bookmark_list with @bookmarks
View->>-Controller: HTML
Controller->>-Browser: 200 OK, body HTML
Browser->>-User: see bookmark list

User->>+Browser: clicks 'add new bookmark'
Browser->>+Controller: GET /bookmarks/new
Controller->>+View: render :new_bookmark
View->>-Controller: HTML
Controller->>-Browser: 200 OK, body HTML
Browser->>-User: see add bookmark form

User->>+Browser: fills in name, URL, clicks submit
Browser->>+Controller: POST /bookmarks/add
Controller->>+Model: bookmark.add
Controller->>-Browser: 303 Redirect, /bookmarks
Browser->>+Controller: GET /bookmarks
Controller->>+Model: bookmark.show_bookmarks
Model->>-Controller: bookmark list array
Controller->>+View: render :bookmarks with new bookmark
View->>-Controller: HTML
Controller->>-Browser: 200 OK, body HTML, @bookmarks
Browser->>-User: sees updated bookmark list
```
