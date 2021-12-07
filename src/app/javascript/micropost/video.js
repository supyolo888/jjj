var playbtn = document.querySelectorAll('.playbtn');
var video = document.querySelectorAll('.video');
var play = document.querySelectorAll('.play');

for (let i = 0; i < video.length; i++) {
  playbtn[i].onclick = function() {
    if (video[i].paused) {
      for (let n = 0; n < video.length; n++) {
        video[n].pause();
        play[n].classList.remove("none");
        }
        video[i].play();
        play[i].classList.add("none");
    } else {
        video[i].pause();
        play[i].classList.remove("none");
    }
  };
};



