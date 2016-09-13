System.import('product.js')
  .then(function(m) {
    var product = new m.Product("Product");
    describe('1st tests', function() {
      it('true is true', function() { expect(true).toEqual(true) });
      it('greet() Hello, Product', function() { expect(product.greet()).toEqual("Hello, Product") });
    });
  });
