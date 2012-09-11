require.config({
  paths: {
    // Paths
    libs:         "js/libs",
    plugins:      "js/plugins",
    // Libraries
    jquery:       "libs/jquery",
    "jquery.easing": "libs/jquery-easing",
    underscore:   "libs/underscore",
    backbone:     "libs/backbone",
    domReady:     "libs/require-domReady",
    // Template
    templates:    "../templates"
  },
  shim: {
    jquery: {
      exports: "$"
    },
    underscore: {
      exports: "_"
    },
    backbone: {
      deps:    ["underscore", "jquery"],
      exports: "Backbone"
    },
    "jquery.easing": {
      deps:    ["jquery"],
      exports: "jQuery.easing"
    },
    app: {
      deps:    ["backbone", "jquery.easing"],
      exports: "App"
    }
  }
});

require(["app", "domReady"], function(App) {
  App.init();
});