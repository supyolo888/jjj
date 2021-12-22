(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["micropost/application"],{

/***/ "./app/javascript/micropost/video.js":
/*!*******************************************!*\
  !*** ./app/javascript/micropost/video.js ***!
  \*******************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

/* WEBPACK VAR INJECTION */(function($) {var playbtn = document.querySelectorAll('.playbtn');
var video = document.querySelectorAll('.video');
var play = document.querySelectorAll('.play');

var _loop = function _loop(i) {
  playbtn[i].onclick = function () {
    if (video[i].paused) {
      for (var n = 0; n < video.length; n++) {
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

for (var i = 0; i < video.length; i++) {
  _loop(i);
}

;
$(window).on('scroll resize', function () {
  var windowScrollTop = $(window).scrollTop();
  var windowInnerHeight = window.innerHeight;

  for (var _i = 0; _i < video.length; _i++) {
    var rect = video[_i].getBoundingClientRect();

    var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    var videoTop = rect.top + scrollTop;
    var videoHeight = video[_i].clientHeight;

    if (!video[_i].paused && (windowScrollTop + windowInnerHeight < videoTop || windowScrollTop > videoTop + videoHeight)) {
      video[_i].pause();

      video[_i].currentTime = 0;

      play[_i].classList.remove("none");
    }
  }
}).trigger('scroll');
/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__(/*! jquery/src/jquery */ "./node_modules/jquery/src/jquery.js")))

/***/ }),

/***/ "./app/javascript/packs/micropost/application.js":
/*!*******************************************************!*\
  !*** ./app/javascript/packs/micropost/application.js ***!
  \*******************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(/*! micropost/video */ "./app/javascript/micropost/video.js");

/***/ })

},[["./app/javascript/packs/micropost/application.js","runtime~micropost/application","vendors~application~micropost/application"]]]);
//# sourceMappingURL=application-def928e12160d36ee1fa.chunk.js.map