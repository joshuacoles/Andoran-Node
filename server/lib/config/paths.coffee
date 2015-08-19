path = require 'path'

module.exports = (root) -> module.exports = formProps(root)

rooted = (root, extra) ->
  path.join root, extra

formProps = (globalRoot) ->
  clientRoot = rooted globalRoot, 'client'
  serverRoot = rooted globalRoot, 'server'
  return {
  reRoot: formProps

  root: globalRoot
  client: {
    root: clientRoot
    stylesheets: rooted clientRoot, 'stylesheets'
    javascripts: rooted clientRoot, 'javascripts'
    images: rooted clientRoot, 'images'
    svgs: rooted clientRoot, 'svgs'
    fonts: rooted clientRoot, 'fonts'
    views: rooted clientRoot, 'views'
  }
  server: {
    root: rooted globalRoot, 'server'
    routes: rooted serverRoot, 'routes'
    lib: rooted serverRoot, 'lib'
  }
  }