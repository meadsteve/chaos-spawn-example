// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "web/static/js/app.js".

// To use Phoenix channels, the first step is to import Socket
// and connect at the socket path in "lib/my_app/endpoint.ex":
import {Socket} from "deps/phoenix/web/static/js/phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

socket.connect()

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("count:updates", {})
channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

channel.on("updated_count", payload => {
    console.log(payload.body);
})

export default socket
