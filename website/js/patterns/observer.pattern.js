/**
 * observer design pattern
 *
 * to notify object changes to all observers automatically
 *
 *
 */
 ;(function(){
  /**
   *
   * generic observer class to manage observers
   *
   *
   */
  var observerCollections = (function() {
    return {
      observers: [],
      add: function(observer) {
        this.observers.push(observer);
        return observer;
      },

      count: function() {
        return this.observers.length;
      },

      get: function(index) {
        if(index > -1 && index < this.observers.length){
          return this.observers[index];
        }
      },

      removeObserver: function(index) {
        if(index > -1 && index < this.observers.length){
          this.observers.splice(index, 1);
        }
      }
    };
  });

  /**
   *
   * the observable object which is willing to notify for its state changes
   *
   *
   */
  var observableObject = (function() {
    this.observers = new observerCollections();

    this.addObserver = function(observer) {
      this.observers.add(observer);
    };

    this.removeObserver = function(observer) {
      this.observers.removeObserver(this.observers.indexOf(observer, 0));
    };

    this.notify = function(ctx) {
      var count = this.observers.count();
      for(var i=0;i < count; i++) {
        this.observers.get(i).update(ctx);
      }
    };
  });

  /**
   *
   * the observer object which is listing on the observable object
   *
   *
   */
  var observerObject = (function() {
    this.update = function(ctx) {
      console.log("Object has updated and its context is");
      console.log(ctx);
    }
  });

  var willingToNotify = new observableObject();
  var listener1 = new observerObject();
  var listener2 = new observerObject();
  var listener3 = new observerObject();

  willingToNotify.addObserver(listener1);
  willingToNotify.addObserver(listener2);
  willingToNotify.addObserver(listener3);

  console.log("Something has changed willingToNotify object states. Notifying now ...");
  willingToNotify.notify("CHANGED!");

 })();
