import {Socket} from "phoenix"

function setup_elm() {
  let elmDiv = document.getElementById("elm-main");
  Elm.embed(Elm.Main, elmDiv)
}

let App = {
  init: () => {
    setup_elm()
  }
}

export default App
