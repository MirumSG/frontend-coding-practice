/**
 * factory design pattern
 *
 * centralize object creation for different tasks
 *
 *
 */
 ;(function(){
  var car = (function(options) {
    console.log("Car has been created.");
  });

  var motorbike = (function(options) {
    console.log("Motorbike has been created.");
  });

  var bicycle = (function(options) {
    console.log("Bicycle has been created.");
  });

  var factory = (function(type, options) {
    this.vehicle = car
    if(type == 'motorbike') {
      this.vehicle = motorbike;
    }else if(type == 'bicycle') {
      this.vehicle = bicycle;
    }

    return new this.vehicle(options);
  });

  factory('bicycle');
  factory('car');
  factory('motorbike');

 })();
