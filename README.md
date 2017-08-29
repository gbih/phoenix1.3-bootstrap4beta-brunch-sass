# Running Phoenix 1.3 with Bootstrap v4.0.0-beta and Sass

Install sass-brunch to enable sass compilation with the default Phoenix 1.3 package.

Note: popper.js replaces tether.js in Bootstrap v4.0.0-beta

```
mix phx.new sasstest --no-ecto
cd sasstest/assets

npm install font-awesome --save
npm install bootstrap@4.0.0-beta --save
npm install sass-brunch --save-dev
npm install popper.js --save

```


Then in brunch-config.js, enable the sass plugin

```
exports.config = {
  files: {
    javascripts: {
      joinTo: "js/app.js"
    },
    stylesheets: {
      joinTo: "css/app.css"
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    assets: /^(static)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: ["static", "css", "js", "vendor"],
    // Where to compile files to
    public: "../priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/vendor/]
    },

    sass: {
      options: {
        // tell sass-brunch where to look for files to @import
        includePaths: ["node_modules/bootstrap/scss"],
        precision: 8 // minimum precision required by bootstrap
      }
    },

  },

  modules: {
    autoRequire: {
      "js/app.js": ["js/app"]
    }
  },

  npm: {
    enabled: true
  }
};

```


Inside the assets/css folder, change app.css to app.scss and edit as:


```
/* place before rest of bootstrap import */
@import "./custom";


// 1. Import bootstrap for all bootstrap 
// @import "bootstrap";

// 2. Or, import individual packages for more customization


@import "functions";
@import "variables";
@import "mixins";
@import "print";
@import "reboot";
@import "type";
@import "images";
@import "code";
@import "grid";
@import "tables";
@import "forms";
@import "buttons";
@import "transitions";
@import "dropdown";
@import "button-group";
@import "input-group";
@import "custom-forms";
@import "nav";
@import "navbar";
@import "card";
@import "breadcrumb";
@import "pagination";
@import "badge";
@import "jumbotron";
@import "alert";
@import "progress";
@import "media";
@import "list-group";
@import "close";
@import "modal";
@import "tooltip";
@import "popover";
@import "carousel";
@import "utilities";

```


Create _custom.scss in same folder as app.scss.
Place your custom sass here, such as

```
$white:  gray !default;

```


You can run brunch build to force a new build into priv/static/css/app.css

