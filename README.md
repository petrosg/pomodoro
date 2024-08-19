# Pomodoro
This project was created based on a tutorial about dynamically refreshing a live view page. It has been modified to function as a basic pomodoro timer with a countdown feature.

Originally, the intention was to use buttons to set the time, but there were issues with the timer resetting. As a result, the approach was changed to using a dropdown menu.

## Docker Configuration
This has now been removed in favor of asdf configurations (see [tool-versions](./.tool-versions) )

## Setup
Assuming you are using `asdf` for version configuration:

  * Run `asdf install` from the project root directory
  * Install dependencies with `mix deps.get`.
  * Start the Phoenix endpoint with `mix phx.server` or `iex -S mix phx.server`.

You can now visit [`localhost:4040`](http://localhost:4000) in your browser.

Ready to run in production? Please [check the deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## ToDo (maybe)
  - [x] Explore Unit Testing.
  - [ ] Explore using buttons instead of dropdowns.
  - [ ] Change colors when busy/on break.
  - [ ] Play an audio file when the timer reaches 0.

## Resources
The tutorial for live view can be found [here](https://online.pragmaticstudio.com/courses/liveview/).

## Learn more
  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
