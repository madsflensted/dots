# Dots

A demo of using [Elm](http://elm-lang.org) with Elixir's [PhoenixFramwework](http://phoenixframework.org)

## To run you will need
* Elixir, [installation](http://elixir-lang.org/install.html), used version 1.0.4 for the talk.
* Elm, [installation](http://elm-lang.org/install), used version 0.15 talk
* nodejs

Then in your cloned copy of this repo:
```
mix deps.get
npm install
mix phoenix.server
```
Open app at`localhost:4000`

## Step'ing

The repo has some branches I used to advance the talk.
Not all branches are in working condition, and requires coding or enabling of code to work.

Here is a brief overview, each branch is called stepX where X is:

1. after running mix phoenix.new
2. added support for live compile-reload of elm modules
3. add routes and pages to support the final app
4. add empty Elm modules to support the app
5. the Elm code for Board and Pad (v1)
6. Setup socket and channels
7. add input config for Pad, as reply on channel.join
8. try to manage the flooding of messages, use :observer.start()

# TODO's

1. Investigate bottle neck leading to build up of messages in one of channel processes' mailbox

## Notes
This demo was put together for the [Copenhagen Elixir June 2015 meetup](http://github.com/cphex/cphex/issues/20)

The few "slides" I had can be found [here](https://github.com/madsflensted/presentations/tree/master/cphex_phoenix_and_elm)

## License
MIT License

## Copyright
2015 Mads Flensted-Urech
