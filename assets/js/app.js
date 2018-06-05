import socket from "./socket";

let channel = socket.channel("daily:lobby", {});
let playNowButton = document.querySelector("button");
console.log(playNowButton);

channel
  .join()
  .receive("ok", resp => {
    console.log("Joined");
  })
  .receive("error", resp => {
    console.error("Unable to join", resp);
  });

const loadAndPlayVideo = player => ({ videoId }) => {
  player.loadVideoById(videoId);
  player.playVideo();
};

function onYouTubeIframeAPIReady() {
  let player = new YT.Player("player", { height: "390", width: "640" });
  channel.on("play", loadAndPlayVideo(player));
}

window.onYouTubeIframeAPIReady = onYouTubeIframeAPIReady;
