/**
 * command design pattern
 *
 * avoid calling command function directly so that adding new params may not break the app
 *
 *
 */
 ;(function(){

  var transactionManager = {
    buy: function(id, price, name) {
      console.log("Buying " + name);
    },

    sell: function(id, price, name) {
      console.log("Selling " + name);
    },

    execute: function(command) {
      return transactionManager[command] && transactionManager[command].apply(transactionManager, [].slice.call(arguments, 1))
    }

  };

  transactionManager.execute('buy', '1', '100.10', 'HD Worth');

 })();
