import {Socket} from "phoenix"

function setup_pad() {
  let config = {
    config: {
      id: 101,
      radius: 20.0,
      color: { red: 100, green: 50, blue: 150, alpha: 0.5 }
    }
  }
  let module = Elm.fullscreen(Elm.Pad, config)
  module.ports.addPoint.subscribe(value => {
    console.log("addPoint:")
    console.dir(value);
  })
  module.ports.movePoint.subscribe(value => {
    console.log("movePoint:")
    console.dir(value);
  })
  module.ports.removePoint.subscribe(value => {
    console.log("removePoint:")
    console.dir(value);
  })
}

function setup_board() {
  let config = {
    newDots: { id: 0, x: 0.0, y: 0.0, radius: 0.0, color: {red: 0, green: 0, blue: 0, alpha: 0.0}},
    moveDots: [ 0, [0.0, 0.0] ]
  }
  let module = Elm.fullscreen(Elm.Board, config)
  let firstDot = { id: 1, x: 10.0, y: 2.0, radius: 20.0, color: {red: 100, green: 200, blue: 20, alpha: 0.5}}
  module.ports.newDots.send(firstDot)
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
