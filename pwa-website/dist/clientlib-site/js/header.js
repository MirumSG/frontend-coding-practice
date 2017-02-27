"use strict";
var $ = require('jquery');
require('bootstrap');
var Header = (function () {
    function Header(name) {
        this.name = name;
    }
    Header.prototype.greet = function () {
        return "Hello, " + this.name + " (" + new Date().getTime() + ")";
    };
    return Header;
}());
var header = new Header('Win');
$('#name').html(header.greet());
