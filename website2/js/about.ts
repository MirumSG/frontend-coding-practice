import * as $ from 'jquery';

class About {
  name: string;
  constructor(name: string) {
    this.name = name;
  }

  greet(): string {
    return "Hello, " + this.name + " ("+ new Date().getTime() +")";
  }
}

let about = new About('Win1');
$('#about').html(about.greet());
