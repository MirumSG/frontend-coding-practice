/// <reference path="../../dts/declaration.d.ts" />

System.config({
  // defaultJSExtensions: true,
  packages: {
    'shared': {
      defaultExtension: 'js',
      main: 'shared.js'
    }
  },
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
