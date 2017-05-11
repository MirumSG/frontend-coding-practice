"use strict";
var $ = require('jquery');
require('bootstrap');
var Footer = (function () {
    function Footer(name) {
        this.name = name;
    }
    Footer.prototype.greet = function () {
        return "Hello, " + this.name + " (" + new Date().getTime() + ")";
    };
    return Footer;
}());
var footer = new Footer('Footer');
$('#about').html(footer.greet());
