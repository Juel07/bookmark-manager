# Bookmark Manager

## Set-Up Instructions

### Set up SQL Database
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

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

### Domain Model

Nouns
bookmark
<!-- user -->
list

Verbs
show

<img src="/docs/domain-model_US1.png">

### MVC

User->>+Browser: requests `bookmarks`
Browser->>+Controller: GET /bookmarks
Controller->>+Model: bookmark_list
Model->>-Controller: bookmark_list array
Controller->>+View: render :bookmark_list with @bookmarks
View->>-Controller: HTML
Controller->>-Browser: 200 OK, body HTML
Browser->>-User: see bookmark list
