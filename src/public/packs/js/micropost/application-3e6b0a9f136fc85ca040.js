/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/micropost/application.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/micropost/video.js":
/*!*******************************************!*\
  !*** ./app/javascript/micropost/video.js ***!
  \*******************************************/
/*! no static exports found */
/***/ (function(module, exports) {

var playbtn = document.querySelectorAll('.playbtn');
var video = document.querySelectorAll('.video');
var play = document.querySelectorAll('.play');

var _loop = function _loop(i) {
  playbtn[i].onclick = function () {
    if (video[i].paused) {
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
var ytPlayer = [];
var ytPlaying, ytStop, ytPlay;

function onPlayerStateChange(event) {
  // 各プレーヤーの状態を確認
  for (var i = 0; i < video.length; i++) {
    var thisState = video[i].getPlayerState();

    if (thisState == 1 && ytPlaying == undefined) {
      ytPlaying = i;
    } else if (thisState == 1 && ytPlaying != i) {
      ytStop = ytPlaying;
      ytPlay = i;
    } else {}
  } // 同時再生があった場合、元々再生していた方を停止する


  if (ytStop != undefined) {
    ytPlayer[ytStop].pauseVideo();
    ytStop = undefined;
  } // 現在再生中のプレーヤー番号を保存しておく


  if (ytPlay != undefined) {
    ytPlaying = ytPlay;
    ytPlay = undefined;
  }
}

/***/ }),

/***/ "./app/javascript/packs/micropost/application.js":
/*!*******************************************************!*\
  !*** ./app/javascript/packs/micropost/application.js ***!
  \*******************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(/*! micropost/video */ "./app/javascript/micropost/video.js");

/***/ })

/******/ });
//# sourceMappingURL=application-3e6b0a9f136fc85ca040.js.map