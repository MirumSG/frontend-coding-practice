import * as $ from 'jquery';
import 'bootstrap';

class Footer {
  name: string;
  constructor(name: string) {
    this.name = name;
  }

  greet(): string {
    return "Hello, " + this.name + " ("+ new Date().getTime() +")";
  }
}

let footer = new Footer('Footer');
$('#about').html(footer.greet());
