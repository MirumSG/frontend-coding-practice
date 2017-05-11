"use strict";
var $ = require('jquery');
require('bootstrap');
var shared_1 = require('./shared');
var Product = (function () {
    function Product(name) {
        this.name = name;
        console.log(shared_1.Common.test());
    }
    Product.prototype.greet = function () {
        // $.get('https://aiaas.pandorabots.com');
        return "Hello, " + this.name;
    };
    Product.prototype.render = function () {
        // every static rendering will use promise. no need to worry about async issue
        var sampleDiv = '<div>sample</div>';
        // $('#name').append(sampleDiv);
        var defer = $.Deferred();
        // $.get('/about.html')
        //   .success((data: string) => {
        //      for(var i=0;i < 10;i++) {
        //       sampleDiv += '<div>sample'+ i +'</div>';
        //     }
        //     defer.resolve(sampleDiv);
        //   })
        //   .error((error: any) => {
        //     defer.reject(error);
        //   });
        defer.resolve(sampleDiv);
        return defer.promise();
    };
    return Product;
}());
exports.Product = Product;
var product = new Product('Product');
product.greet();
product.render();
