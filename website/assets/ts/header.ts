import * as $ from 'jquery';
import 'bootstrap';

class Header {
  name: string;
  constructor(name: string) {
    this.name = name;
  }

  greet(): string {
    return "Hello, " + this.name + " ("+ new Date().getTime() +")";
  }
}

let header = new Header('Win');
$('#name').html(header.greet());
