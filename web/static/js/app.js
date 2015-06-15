import {Socket} from "phoenix"

function setup_pad() {
  Elm.fullscreen(Elm.Pad)
}

function setup_board() {
  Elm.fullscreen(Elm.Board)
}

// Show javascript typo
function setup_elm() {
  let elmDiv = document.getElementById("elm");
  if (elmDiv) {
    let moduleName = elmDiv.getAttribute('data-elm-module')
    if (moduleName == "Board") {
      setup_board()
    } else if (moduleName == "Pad") {
      setup_pad()
    } else {
      throw "Unknown Elm module '" + moduleName + "' !!"
    }
  }
}

let App = {
  init: () => {
    setup_elm()
  }
}

export default App
