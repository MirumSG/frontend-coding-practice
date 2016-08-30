/**
 * mediator design pattern
 *
 * a central point (mediator) to communicate with multiple external sources/components
 * can use observer instead if there is not many multiple components
 *
 * an air traffic tower (mediator) handles what planes can take off or landed by broadcasting
 */
 ;(function(){
  /**
   * mediator container
   *
   * a mediator container to broadcast all registered components' event
   *
   *
   */
  var mediator = (function() {
    var components = [];

    return {
      init: function() {
        this.broadcast('init', this);
      },

      addComponent: function(component) {
        for(var i in components){
          if(components[i] == component) break;
        }

        components.push(component);
      },

      removeComponent: function(index) {
        if(index > -1 && this.components.length > index) {
          this.components.splice(index, 1);
        }
      },

      broadcast: function(event, source) {
        for(var i in components){
          // if(components[i] == component) break;
          components[i][event](source);
        }
      }
    };
  })();

  var component1 = (function() {
    return {
      init: function(source) {
        console.log("component1 has been initialized");
      },
      render: function(ctx) {
        console.log("component1 has been rendered with " + ctx);
      }
    }
  })();

  var component2 = (function() {
    return {
      init: function(source) {
        console.log("component2 has been initialized");
      },
      render: function(ctx) {
        console.log("component2 has been rendered with " + ctx);
      }
    }
  })();

  mediator.addComponent(component1);
  mediator.addComponent(component2);

  mediator.init();
  mediator.broadcast("render", "TEST!");

 })();
