/// <reference path="../../dts/declaration.d.ts" />

System.config({
  map: {
    jquery: 'vendors/jquery.js',
    bootstrap: 'vendors/bootstrap.min.js'
  },
  meta: {
    'bootstrap': {
      deps: [
        'jquery'
      ]
    }
  }
});
