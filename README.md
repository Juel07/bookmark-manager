# Bookmark Manager

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
