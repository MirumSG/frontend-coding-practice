/**
 * facade design pattern
 *
 * a way to expose complex internal logic as simple logic to public
 *
 *
 */
 ;(function(){
  var complexLogic = (function() {
    var _internal = {
      i: 0,
      increase: function() {
        _internal.i++;
      },

      decrease: function() {
        _internal.i--;
      },

      run: function(incr, decr) {
        for(var i=0; i < incr;i++) {
          _internal.increase();
        }
        for(var i=0; i < decr;i++) {
          _internal.decrease();
        }

        console.log("Final count is " + _internal.i);
      }
    };

    return {
      run: _internal.run
    };
  })();

  complexLogic.run(5, 1);

 })();
