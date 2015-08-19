// Generated by CoffeeScript 1.9.3
(function() {
  var formProps, path, rooted;

  path = require('path');

  module.exports = function(root) {
    return module.exports = formProps(root);
  };

  rooted = function(root, extra) {
    return path.join(root, extra);
  };

  formProps = function(globalRoot) {
    var clientRoot, serverRoot;
    clientRoot = rooted(globalRoot, 'client');
    serverRoot = rooted(globalRoot, 'server');
    return {
      reRoot: formProps,
      root: globalRoot,
      client: {
        root: clientRoot,
        stylesheets: rooted(clientRoot, 'stylesheets'),
        javascripts: rooted(clientRoot, 'javascripts'),
        images: rooted(clientRoot, 'images'),
        svgs: rooted(clientRoot, 'svgs'),
        fonts: rooted(clientRoot, 'fonts'),
        views: rooted(clientRoot, 'views')
      },
      server: {
        root: rooted(globalRoot, 'server'),
        routes: rooted(serverRoot, 'routes'),
        lib: rooted(serverRoot, 'lib')
      }
    };
  };

}).call(this);

//# sourceMappingURL=properties.js.map
