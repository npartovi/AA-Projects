const httpRequest = new XMLHttpRequest();

httpRequest.addEventListener('load', clipsLoaded);
httpRequest.open('GET', 'https://api.twitch.tv/kraken/clips/top?limit=10&game=Overwatch&trending=true');
httpRequest.setRequestHeader('Client-ID', 'k4dojj9d9vu0h1na9yhyonozdtyjvg');
httpRequest.setRequestHeader('Accept', 'application/vnd.twitchtv.v5+json');
httpRequest.send();


function clipsLoaded() {
    let clipsDisplay = document.getElementById('clips-display'),
        clipList = JSON.parse(httpRequest.responseText);

    clipList.clips.forEach(function(clip, index, array) {
        clipItem = document.createElement('div');
        clipItem.innerHTML = clip.embed_html;
        clipsDisplay.appendChild(clipItem);
    });
}