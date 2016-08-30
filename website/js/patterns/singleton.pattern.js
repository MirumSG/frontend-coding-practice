/**
 * singleton design pattern
 *
 * to restict instantiation of a class to a single object
 *
 *
 */
 ;(function(){
  var countingService = (function(){
    var instance;

    function init() {
      return {
        count: 0,
        incr: function() {
          console.log("Increasing count");
          this.count++;
        },
        decr: function() {
          console.log("Decreasing count");
          instance.count--;
        }
      };
    };

    return {
      getInstance: function() {
        if(!instance) {
          instance = init();
        }

        return instance;
      }
    }
  })();

  var countA = countingService.getInstance();
  countA.incr();
  var countB = countingService.getInstance();
  countB.incr();
  console.log("Total count is " + countB.count);
  var countC = countingService.getInstance();
  countC.decr();
  console.log("Total count after decrement is " + countC.count);
 })();
