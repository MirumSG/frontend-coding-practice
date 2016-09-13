import * as $ from 'jquery';
System.import('bootstrap');

class Header {
  name: string;
  constructor(name: string) {
    this.name = name;
  }

  greet(): string {
    return "Hello, " + this.name + " ("+ new Date().getTime() +")";
  }
}

zone.run(() => {
  let header = new Header('Win');
  $('#name').html(header.greet());

  // console.log(profiling.benchmark());
});
