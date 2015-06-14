import {Socket} from "phoenix"

// let socket = new Socket("/ws")
// socket.connect()
// let chan = socket.chan("topic:subtopic", {})
// chan.join().receive("ok", chan => {
//   console.log("Success!")
// })

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
