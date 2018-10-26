# Bookmark Manager!

This is the Bookmark Manager app that we completed during week 4 of Makers.

## User stories

```
As an internet user,
So I can see my favourite websites,
I would like to view a list of my bookmarks.

As an internet user,
So that I can keep my bookmarks up to date,
I would like to be able to add new bookmarks.

As an internet user,
So that my bookmarks can forgive any errors,
I would like to be able to update my bookmarks.

As an internet user,
So that my bookmarks can adapt to my changing tastes,
I would like to be able to delete bookmarks.
```

## Diagram of request-response cycle
Here is an example request-response cycle for the app. This cycle maps out the user sending a GET request for the list of bookmarks at /bookmarks. The controller handles the request, asking for a @bookmarks instance variable from the Bookmark class via the .all_entries method. In turn, this method asks the DatabaseConnection class to query a database using its .query method. The DatabaseConnection object uses the PG gem to execute this request, returning a #<PG::Result> object. The Bookmark class then maps over this result from the DatabaseConnection.query, returning new instances of Bookmark that are then assigned as an array to the @bookmarks instance variable in the controller. The bookmarks.erb view file then uses this instance variable to print out a list of bookmark titles with urls as their href. This information is sent back to the user as HTML in a HTTP 200 OK response.

![image][./bookmark-manager-request-response.png]

## Setup instructions
- Connect to `psql`
For your bookmarks database:
- Create the database with `CREATE DATABASE bookmark_manager;`
- Connect to this database using `\c bookmark_manager;`
- Run the query in `./db/migrations/01_creating_bookmarks_table.sql`.
For the testing database:
- Create the database with `CREATE DATABASE bookmark_manager_test;`
- Connect to this database using `\c bookmark_manager_test;`
- Run the query in `./db/migrations/02_creating_test_bookmarks_table.sql`.
