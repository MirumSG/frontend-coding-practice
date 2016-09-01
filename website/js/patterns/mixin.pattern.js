/**
 * mixin design pattern
 *
 * class that can be inheritted by sub class or group of sub classes
 *
 *
 */
 ;(function(){
  var moveMixin = (function() {
    return {
      moveup: function() {
        console.log("Moving up");
      },

      movedown: function() {
        console.log("Moving down");
      },

      stop: function() {
        console.log("Stop Moving");
      }
    };
  })();

  var moveCar = (function() {
    return {
      start: function() {
        console.log("Start moving car");
      }
    };
  })();

  var moveMotorbike = (function() {
    return {
      start: function() {
        console.log("Start moving motorbike");
      }
    };
  })();

  $.extend(moveCar, moveMixin);
  $.extend(moveMotorbike, moveMixin);

  moveCar.start();
  moveCar.moveup();
  moveMotorbike.start();
  moveMotorbike.movedown();
 })();
