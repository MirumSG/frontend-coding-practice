/// <reference path="../../dts/declaration.d.ts" />

class ProductSpec {
  p: any;

  constructor(executeAll?: boolean) {
    beforeEach((done: any) => {
      System.import('product.js')
        .then((p: any) => {
          this.p = p;
          done();
        })
    });

    if(executeAll === true) {
      this.executeAll();
    }
  }

  executeAll(): void {
    describe('Product Component', () => {
      this.greet();
      this.render();
    });
  }

  greet(): void {
    it('greet() Hello, Product', () => {
      let product = new this.p.Product("Product");
      expect(product.greet()).toEqual("Hello, Product");
    });
  }

  render(): void {
    it('render() should give <div>sample</div>', () => {
      let product = new this.p.Product("Product");
      product
        .render()
        .then((response: string) => {
          expect(response).toEqual("<div>sample</div>");
        });

    });
  }
}

new ProductSpec(true);
