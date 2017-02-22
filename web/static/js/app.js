import socket from "./socket";

let channel = socket.channel("daily:lobby", {});

channel.on("play", data => {
  console.log(data);
  playVideo(data.videoId);
});

channel.join().receive("ok", resp => {
  console.log("Joined successfully", resp);
}).receive("error", resp => {
  console.log("Unable to join", resp);
});

function playVideo(videoId) {
  return new YT.Player("player", {
    height: "390",
    width: "640",
    videoId: videoId,
    events: { onReady: onPlayerReady }
  });
}

function onPlayerReady(event) {
  event.target.playVideo();
}

(function injectYoutubeAPI() {
  let tag = document.createElement("script");
  tag.src = "https://www.youtube.com/iframe_api";
  let firstScriptTag = document.getElementsByTagName("script")[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
})();

