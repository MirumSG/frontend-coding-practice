/**
 * immediately-invoked function
 *
 * good practice to prevent from variable to being expose globally.
 * every changes happen within the function will apply for that context.
 *
 */
;(function(){
  var dataObject = {},
      dataArray = [];

  _.each([1,2,3], function(num){
    dataArray.push(num);
  });

  console.log(dataArray);
})();

$(document).ready(function(){
  /**
   * extends custom function into jquery object.
   *
   *
  */
  $.fn.exists = function() {
    return ($(this).length > 0);
  };

  /**
   * jQuery events chain
   *
  */
  $('div')
    .find('.search-submodule')
      .css('background-color', 'red')
      .end()
    .find('.input-group')
      .css('font-weight', 'bold')
      .end();

  if($('.search-submodule').exists() === true) {
    console.log('the search-submodule exists.');
  }else {
    console.log('the search-submodule does not exists.');
  }
});
