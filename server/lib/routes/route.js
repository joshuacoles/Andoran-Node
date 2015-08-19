// Generated by CoffeeScript 1.9.3
(function() {
  var _, configureController, route, view;

  _ = require('underscore');

  configureController = function(routeModule, body) {
    var router;
    router = require('express').Router();
    body(router, route(router), view);
    return routeModule.exports = router;
  };

  route = function(router) {
    return function(name, body) {
      return router.get(name, body);
    };
  };

  view = function(name, data) {
    return function(req, res, next) {
      if (data === void 0) {
        return res.render(name);
      } else if (typeof data === 'function') {
        return res.render(name, data(req, res));
      } else if (typeof data === 'object') {
        return res.render(name, data);
      } else {
        throw "The info given must be of type 'object' or 'function'";
      }
    };
  };

  module.exports = function(routeModule) {
    return _.partial(configureController, routeModule);
  };

}).call(this);

//# sourceMappingURL=route.js.map