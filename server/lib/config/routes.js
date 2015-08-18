// Generated by CoffeeScript 1.9.2
(function() {
  var path, props, route,
    slice = [].slice;

  path = require('path');

  props = require('./properties');

  route = function(routePath) {
    return path.join(props.server.routes, routePath);
  };

  module.exports = function(app) {
    return function() {
      var args;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      switch (args.length) {
        case 1:
          return require(route(args[0]));
        case 2:
          return app.use(args[0], require(route(args[1])));
        default:
          throw "Wrong number of args, either (path) to get the route object or (baseURL, path) to assign it.";
      }
    };
  };

}).call(this);

//# sourceMappingURL=routes.js.map
