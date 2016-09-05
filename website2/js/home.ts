import * as $ from 'jquery';

class Home {
  name: string;
  constructor(name: string) {
    this.name = name;
  }

  greet(): string {
    return "Hello, " + this.name + " ("+ new Date().getTime() +")";
  }
}

let home = new Home('Win');
$('#name').html(home.greet());
