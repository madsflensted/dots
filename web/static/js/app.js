import {Socket} from "phoenix"

function setup_pad(channel, {id: id, color: color}) {
  let defaults = {
    config: {
      id: id,
      radius: 20.0,
      color: { red: color.red, green: color.green, blue: color.blue, alpha: 0.5 }
    }
  }
  let module = Elm.fullscreen(Elm.Pad, defaults)
  module.ports.addPoint.subscribe(dot => {
    channel.push("add_dot", {body: dot})
  })
  module.ports.movePoint.subscribe(value => {
    channel.push("move_dot", {body: value})
  })
  module.ports.removePoint.subscribe(id => {
    channel.push("remove_dot", {body: id})
  })
}

function setup_board(channel) {
  let defaults = {
    newDots: { id: 0, x: 0.0, y: 0.0,
      radius: 0.0, 
      color: {red: 0, green: 0, blue: 0, alpha: 0.0}
    },
    moveDots: { id: 0, x: 0.0, y: 0.0 },
    removeDots: 0
  }
  let module = Elm.fullscreen(Elm.Board, defaults)
  channel.on("add_dot", (msg) => {
    module.ports.newDots.send(msg.body)
  })
  channel.on("move_dot", (msg) => {
    module.ports.moveDots.send(msg.body)
  })
  channel.on("remove_dot", (msg) => {
    module.ports.removeDots.send(msg.body)
  })
}

// Show javascript typo
function setup_elm(socket) {
  let elmDiv = document.getElementById("elm");
  if (elmDiv) {
    let moduleName = elmDiv.getAttribute('data-elm-module')
    if (moduleName == "Board") {
      let channel = socket.chan("dots:updates", {})
      channel.join().receive("ok", (_config) => {
        console.log("Joined dots:updates")
        setup_board(channel)
      })
    } else if (moduleName == "Pad") {
      let channel = socket.chan("dots:updates", {})
      channel.join().receive("ok", (config) => {
        console.log("Joined dots:updates")
        setup_pad(channel, config)
      })
    } else {
      throw "Unknown Elm module '" + moduleName + "' !!"
    }
  }
}


function setup_socket() {
  let socket = new Socket("/ws")
  socket.connect()
  setup_elm(socket)
}

let App = {
  init: () => {
    setup_socket()
  }
}

export default App
