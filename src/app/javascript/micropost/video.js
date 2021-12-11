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

$(window)
    .on('scroll resize', function () {
        var windowScrollTop = $(window).scrollTop();
        var windowInnerHeight = window.innerHeight;
        for (let i = 0; i < video.length; i++) {
          var rect = video[i].getBoundingClientRect();
          var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
          var videoTop = rect.top + scrollTop;
          var videoHeight = video[i].clientHeight
          if (!video[i].paused && ((windowScrollTop + windowInnerHeight < videoTop) || (windowScrollTop > videoTop + videoHeight))) {
              video[i].pause();
              video[i].currentTime = 0;
              play[i].classList.remove("none");
          }
        }
    })
    .trigger('scroll');
