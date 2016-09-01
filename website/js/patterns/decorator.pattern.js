/**
 * decorator design pattern
 *
 * to add additional functionality into existing class
 *
 *
 */
 ;(function(){
  var vehicle = (function() {
    return {
      go: function() {
        console.log('Go');
      },

      accelerate: function() {
        console.log('Accelerate');
      },

      stop: function() {
        console.log('Stop');
      }
    }
  })();

  var truck = vehicle;
  truck.go();
  truck.pause = function() {
    console.log('Pause');
  };

  var motor = vehicle;
  motor.pause();

 })();
