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

Here is a brief overview:

step1: after running mix phoenix.new
step2: added support for live compile-reload of elm modules
step3: add routes and pages to support the final app
step4: add empty Elm modules to support the app
step5: the Elm code for Board and Pad (v1)
step6: Setup socket and channels
step7: add input config for Pad, as reply on channel.join
step8: try to manage the flooding of messages, use :observer.start()

# TODO's

1. Investigate bottle neck leading to build up of messages in one of channel processes' mailbox

## Notes
This demo was put together for the [Copenhagen Elixir June 2015 meetup](http://github.com/cphex/cphex/issues/20)

The few "slides" I had can be found [here](http://github.com/madsflensted/presentations/cphex_phoenix_and_elm)
