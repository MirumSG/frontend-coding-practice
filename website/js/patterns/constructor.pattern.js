/**
 * constructor design pattern
 *
 * write javascript in oop way
 *
 *
 */
 ;(function(){
  /**
   * Wheel class
   *
   * a wheel class to make wheel for given size
   *
   *
   */
  function Wheel(size){
    this.size = size;
  }

  Wheel.prototype.getSize = function(){
    return this.size;
  }

  /**
   * Car class
   *
   * a car class to make car with different wheel and its size
   *
   *
   */
  function Car(numberOfWheels, wheelSize){
    this.wheels = [];
    this.numberOfWheels = numberOfWheels;
    this.wheelSize = wheelSize;
    for(var i=0;i<this.numberOfWheels;i++){
      this.wheels.push(new Wheel(wheelSize));
    }
  }

  Car.prototype.info = function(){
    console.log("This car has " + this.numberOfWheels + " wheels. And the wheel size is " + this.wheelSize);
  }

  var honda = new Car(4, 32);
  var mitsubishi = new Car(4, 35);

  honda.info();
  mitsubishi.info();
 })();
