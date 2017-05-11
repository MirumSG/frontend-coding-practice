gulp = require 'gulp'
browserSync = require 'browser-sync'
config = require '../config'
chalk = require 'chalk'

connection = {}

###
 Run the build task and start a server with BrowserSync
###

gulp.task('browsersync', () ->
  # Serve files and connect browsers
  browserSync({
    server: {
      baseDir: config.path.dist
    },
    logConnections: false,
    debugInfo: false,
    open: true
  }, (err, data) ->
    if err isnt null
      console.log(
        chalk.red('✘  Setting up a local server failed... Please try again. Aborting.\n') +
        chalk.red(err)
      )
      process.exit(0)

    # Store started state globally
    connection.external = data.options.external
    connection.port = data.options.port
    config.server.lrStarted = true
  )
)
