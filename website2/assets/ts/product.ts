import * as $ from 'jquery';
System.import('bootstrap');

class Product {
  name: string;
  constructor(name: string) {
    this.name = name;
  }

  greet(): string {
    return "Hello, " + this.name + " ("+ new Date().getTime() +")";
  }
}

let product = new Product('Product');
console.log("From product");
console.log(product);
