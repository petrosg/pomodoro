# Pomodoro
This project was done as a result of a tutorial about dynamically refreshing a live view page.
It has been adapted to be a rudimentary pomodoro timer. (Only a countdown really)

The initial intention has been to use buttons to set the time but I kept getting the original timer reset
so I followed the original approach of the dropdown

## Where is the docker configuration?
You can find the docker configuration [`here`](https://gist.github.com/petrosg/a970651bbfa0b77b474e397707c5fd81)
The reason they are provided seperately is because I had a hard time deploying this on gigalixir otherwise.

My folder structure on my local machine looks like this
  * root/
    * docker-compose.yml
    * Dockerfile
    * pomodoro/
      * this git repo...


## Some notes
  * You are welcome to use the docker configuration included in the projects
    * If you opt to not use it, keep in mind that you will have to edit certain config to be able to run ecto commands
  * At no point do you need a database to run this, but I just went with the default project gen files
  * Tailwind included
  * .devcontainer for `VSCode` included


## Setup
Assumes you use `docker compose`

  * `docker compose build`
  * `docker compose up -d`
  * `docker compose exec pomodoro /bin/bash`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4040`](http://localhost:4040) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).


## ToDo (maybe)
  * Explore UnitTesting
  * Explore using buttons instead of dropdowns
  * Change colors when busy/on break
  * Play an audio file when timer reaches 0


## Resources
Tutorial for live view can be found [`here`](https://online.pragmaticstudio.com/courses/liveview/)
Timer image can be found [`here`](https://svgsilh.com/ffffff/image/26095.html).


## Learn more
  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
