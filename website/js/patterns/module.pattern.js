/**
 * module design pattern
 *
 * way to make javascript modular
 *
 *
 */
 ;(function(){
  /**
   * Object Literal
   *
   * object literal type modular pattern. no need to instantiate object
   *
   *
   */
  var deals = {
    numberOfDeals: 9,
    getDeals: function() {
      return [];
    },
    getDeal: function(dealId) {
      return {};
    },
    removeDeals: function(dealIds) {
      return true;
    },
    removeDeal: function(dealId) {
      return true;
    }
  };

  /**
   *
   * extending deals module
   *
   *
   */
  deals.findDeals = function() {
    return [];
  };

  /**
   * Module mixin importing
   *
   * We can import thirdparty object into module and use them within local scope
   *
   *
   */
  var dealsMixins = (function($, _) {
    function internalFindDeals() {
      return [];
    }

    return {
      findDeals: function() {
        console.log("Finding deals in mixin.");
        return internalFindDeals();
      }
    }
  })(jQuery, _);

  dealsMixins.findDeals();

 })();
