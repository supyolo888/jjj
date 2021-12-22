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

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /app/app/javascript/micropost/video.js: Missing semicolon. (12:24)\n\n  10 |         for (let n = 0; n < video.length; n++) {\n  11 |           if (video[n].paused) {\n> 12 |           } elsif(n!==i) {\n     |                         ^\n  13 |             video[n].pause\n  14 |           }\n  15 |         }\n    at Parser._raise (/app/node_modules/@babel/parser/lib/index.js:541:17)\n    at Parser.raiseWithData (/app/node_modules/@babel/parser/lib/index.js:534:17)\n    at Parser.raise (/app/node_modules/@babel/parser/lib/index.js:495:17)\n    at Parser.semicolon (/app/node_modules/@babel/parser/lib/index.js:3520:10)\n    at Parser.parseExpressionStatement (/app/node_modules/@babel/parser/lib/index.js:13686:10)\n    at Parser.parseStatementContent (/app/node_modules/@babel/parser/lib/index.js:13277:19)\n    at Parser.parseStatement (/app/node_modules/@babel/parser/lib/index.js:13139:17)\n    at Parser.parseBlockOrModuleBlockBody (/app/node_modules/@babel/parser/lib/index.js:13728:25)\n    at Parser.parseBlockBody (/app/node_modules/@babel/parser/lib/index.js:13719:10)\n    at Parser.parseBlock (/app/node_modules/@babel/parser/lib/index.js:13703:10)\n    at Parser.parseStatementContent (/app/node_modules/@babel/parser/lib/index.js:13217:21)\n    at Parser.parseStatement (/app/node_modules/@babel/parser/lib/index.js:13139:17)\n    at /app/node_modules/@babel/parser/lib/index.js:13768:68\n    at Parser.withSmartMixTopicForbiddingContext (/app/node_modules/@babel/parser/lib/index.js:12899:14)\n    at Parser.parseFor (/app/node_modules/@babel/parser/lib/index.js:13768:22)\n    at Parser.parseForStatement (/app/node_modules/@babel/parser/lib/index.js:13462:19)\n    at Parser.parseStatementContent (/app/node_modules/@babel/parser/lib/index.js:13166:21)\n    at Parser.parseStatement (/app/node_modules/@babel/parser/lib/index.js:13139:17)\n    at Parser.parseBlockOrModuleBlockBody (/app/node_modules/@babel/parser/lib/index.js:13728:25)\n    at Parser.parseBlockBody (/app/node_modules/@babel/parser/lib/index.js:13719:10)\n    at Parser.parseBlock (/app/node_modules/@babel/parser/lib/index.js:13703:10)\n    at Parser.parseStatementContent (/app/node_modules/@babel/parser/lib/index.js:13217:21)\n    at Parser.parseStatement (/app/node_modules/@babel/parser/lib/index.js:13139:17)\n    at Parser.parseIfStatement (/app/node_modules/@babel/parser/lib/index.js:13502:28)\n    at Parser.parseStatementContent (/app/node_modules/@babel/parser/lib/index.js:13186:21)\n    at Parser.parseStatement (/app/node_modules/@babel/parser/lib/index.js:13139:17)\n    at Parser.parseBlockOrModuleBlockBody (/app/node_modules/@babel/parser/lib/index.js:13728:25)\n    at Parser.parseBlockBody (/app/node_modules/@babel/parser/lib/index.js:13719:10)\n    at Parser.parseBlock (/app/node_modules/@babel/parser/lib/index.js:13703:10)\n    at Parser.parseFunctionBody (/app/node_modules/@babel/parser/lib/index.js:12582:24)");

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
//# sourceMappingURL=application-10d74c55de59c08de297.js.map