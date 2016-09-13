import * as $ from 'jquery';
System.import('bootstrap');

export class Product {
  name: string;

  constructor(name: string) {
    this.name = name;
  }

  greet(): string {
    // $.get('https://aiaas.pandorabots.com');
    // $('#name').html(header.greet());
    return "Hello, " + this.name;
  }

  render(): any {
    // every static rendering will use promise. no need to worry about async issue
    let sampleDiv:string = '<div>sample</div>';
    // $('#name').append(sampleDiv);
    let defer = $.Deferred();

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
    // defer.reject(error);
    return defer.promise();
  }
}


zone
  .fork({
    'onHasTask': (parent, current, target, hasTask) => {
       console.log('>>>>>>>>>>');
    }
  })
  .run(() => {
  let product = new Product('Product');
  console.log("From product");
  product.greet();
  console.log(product);
  profiling.reset();
  setTimeout(() => {
    for(var i=0;i < 10000; i++) {
      console.log('a');
    }
    console.log(profiling.benchmark());
  }, 500)
});
