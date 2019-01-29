# Bookmark Manager App

User Stories
----

```
As a user,
So I can easily find the pages I like,
I want the bookmark manager to show a list of bookmarks.

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager
```

Domain Models
----
Alex's
![](AlexH-UserStory.jpg)

Habakkuk's
![](bookmark_manager_1.png)



Instructions
----

1) Connect to psql
2) Create and connect to database:
```
admin=# CREATE DATABASE bookmark_manager;
admin=# \c bookmark_manager
```
3) Run query in file 01_create_bookmarks_table.sql

4) Check that the table was successfully created:
  \dt
  Expect to see:
  ```
      List of relations
    Schema |   Name    | Type  |     Owner
    --------+-----------+-------+---------------
    public | bookmarks | table | habakkukryong
    (1 row)
    ```

## To set up test database:
  run ./db/migrations/02_create_bookmarks_table_test.sql
