# Bookmark Manager

## Set-Up Instructions

### Set up SQL Databases
1. Connect to psql
2. Create a database using the psql command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the pqsl command `\c bookmark_manager;`
4. Run the query we have saved in the file `01_create_bookmarks_table.sql`
5. Disconnect from database
6. Create a test database using the psql command `CREATE DATABASE bookmark_manager_test;`
7. Connect to the database using the pqsl command `\c bookmark_manager_test;`
8. Run the query we have saved in the file `01_create_bookmarks_table.sql`

## Intended Features

- Show a list of bookmarks
- Add new bookmarks
- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users are restricted to manage only their own bookmarks

## User Story 1

```
As a user,
So that I may easily access my most frequented resources
I would like to show a list of my bookmarks
```

### MVC
```
User->>+Browser: requests `bookmarks`
Browser->>+Controller: GET /bookmarks
Controller->>+Model: bookmark_list
Model->>-Controller: bookmark_list array
Controller->>+View: render :bookmark_list with @bookmarks
View->>-Controller: HTML
Controller->>-Browser: 200 OK, body HTML
Browser->>-User: see bookmark list
```

<img src="/docs/domain-model_US1.png">

## User Story 2

```
As a user,
So that I may add resources to my list
I would like to be able to add a new bookmark
```

### Domain Model

Nouns
- bookmark
- list

Verbs
- show
- add

### Updated MVC

```
sequenceDiagram
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

<img src="/images/User-Story-2_MVC.jpeg">
