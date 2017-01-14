/* jshint node: true, -W030 */
/* globals Phoenix, Window, Modal, Screen, _ */
'use strict';
Phoenix.set({
    'openAtLogin': true
});

var keys = [];
var cmd = ['cmd'];
var ctrlAlt = ['ctrl', 'alt', 'cmd'];

var grids = {
  '1 Up': {rows: 1, cols: 1},
  '2 Up': {rows: 1, cols: 2},
  '3 Up': {rows: 1, cols: 3},
  '4 Up': {rows: 2, cols: 2},
  '6 Up': {rows: 2, cols: 3},
  '9 Up': {rows: 3, cols: 3},
};

var gaps = {
  "vertical": 20,
  "horizontal": 40,
  "top" : 20,
  "bottom" : 20,
  "left" : 40,
  "right" : 40
};

function grid(name) {
  var rows = grids[name].rows;
  var cols = grids[name].cols;
  return function applyGrid() {
    var windows = Window.visibleWindowsInOrder();
    windows.splice(Math.min(windows.length, cols*rows));
    var pre = windows.length;
    var sFrame = Screen.mainScreen().visibleFrameInRectangle();
    var sHeight = sFrame.height;
    var sWidth = sFrame.width;
    var width = Math.round(sWidth / cols) - gaps.right - gaps.left;
    var height = Math.round(sHeight / rows) - gaps.bottom - gaps.top;
    var x = sFrame.x + gaps.left;
    var y = sFrame.y + gaps.top;
    _.times(cols, function(col) {
      _.times(rows, function(row) {
        var n = col + (row*cols);
        var xOffset = 0, yOffset = 0;
        if(col > 0) {
          xOffset = gaps.horizontal;
        }
        if(row > 0) {
          yOffset = gaps.vertical;
        }
        var rect = {
          x: x + (col*width) + xOffset,
          y: y + (row*height),
          width: width,
          height: height
        };
        if (windows.length > n) {
          windows[n].setFrame(rect);
        }
      });
    });
  };
}

keys.push(Phoenix.bind('1', ctrlAlt, grid('1 Up')));
keys.push(Phoenix.bind('2', ctrlAlt, grid('2 Up')));
keys.push(Phoenix.bind('3', ctrlAlt, grid('3 Up')));
keys.push(Phoenix.bind('4', ctrlAlt, grid('4 Up')));
keys.push(Phoenix.bind('6', ctrlAlt, grid('6 Up')));
keys.push(Phoenix.bind('9', ctrlAlt, grid('9 Up')));

function moveFocusFn(dir) {
  return function moveFocus() {
    var fnNames = {
      h: 'focusClosestWindowInWest',
      j: 'focusClosestWindowInSouth',
      k: 'focusClosestWindowInNorth',
      l: 'focusClosestWindowInEast'
    };
    Window.focusedWindow()[fnNames[dir]]();
  };
}
