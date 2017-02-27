/// <reference path="../../dts/declaration.d.ts" />
var ProductSpec = (function () {
    function ProductSpec(executeAll) {
        var _this = this;
        beforeEach(function (done) {
            System.import('product.js')
                .then(function (p) {
                _this.p = p;
                done();
            });
        });
        if (executeAll === true) {
            this.executeAll();
        }
    }
    ProductSpec.prototype.executeAll = function () {
        var _this = this;
        describe('Product Component', function () {
            _this.greet();
            _this.render();
        });
    };
    ProductSpec.prototype.greet = function () {
        var _this = this;
        it('greet() Hello, Product', function () {
            var product = new _this.p.Product("Product");
            expect(product.greet()).toEqual("Hello, Product");
        });
    };
    ProductSpec.prototype.render = function () {
        var _this = this;
        it('render() should give <div>sample</div>', function () {
            var product = new _this.p.Product("Product");
            product
                .render()
                .then(function (response) {
                expect(response).toEqual("<div>sample</div>");
            });
        });
    };
    return ProductSpec;
}());
new ProductSpec(true);
