# Assignment

Read and learn the following resources:

* [Installation](https://hexdocs.pm/phoenix/installation.html)
* [Directory Structure](https://hexdocs.pm/phoenix/directory_structure.html)
* [Request Lifecycle](https://hexdocs.pm/phoenix/request_lifecycle.html)

## Task 1: Generate a new phoenix project

Generate a new project. We won't need a database for this guide, you can skip generation of all database related files with the `--no-ecto` flag.

If you go to localhost:4000 in your browser, you should end up on the index page.

## Task 2: Make a new page

Now add a second page. Add `/hello-world` that displays the text "Hello World" in your browser.

_Tip: you'll only have to be in your `app_name_umbrella/apps/app_name_web` folder._

## Task 3: Generate a random number

Display a third page which generates a random number. Do note: the actual generation of the number should be done in your domain logic app (app_name_umbrella/apps/app_name).

_Note: Challenge yourself. E.g. give a min-max range._

## Task 4: Additional Resources

Read and learn these resources to increase your understanding of the Phoenix framework and prepare yourself for the project:

* [Plugs](https://hexdocs.pm/phoenix/plug.html)
* [Routing](https://hexdocs.pm/phoenix/routing.html)
    * [Nested Resources](https://hexdocs.pm/phoenix/routing.html#nested-resources)
    * [Scoped Routes](https://hexdocs.pm/phoenix/routing.html#scoped-routes)
    * [Path Helpers](https://hexdocs.pm/phoenix/routing.html#path-helpers)
* [Controllers](https://hexdocs.pm/phoenix/controllers.html)
* [Views](https://hexdocs.pm/phoenix/views.html)