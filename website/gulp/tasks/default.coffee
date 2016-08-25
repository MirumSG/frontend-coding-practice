gulp = require 'gulp'
config = require '../config'
del = require 'del'
chalk = require 'chalk'
runSequence = require 'run-sequence'
fs = require 'fs'

gulp.task('default', (cb) ->
  config.destPath = config.path.servepath
  console.log(chalk.magenta.inverse('» Building for development...'))
  runSequence('watch')
)

gulp.task('del', () ->
  #del([config.destPath+'/**/*', '!*.git'],{force: true} , function (err, deletedFiles) {
  del.sync([config.destPath+'/**/*', '!*.git'], {force: true}, (err, deletedFiles) ->
    if err
      console.log(chalk.red('Error deleting files: '+err))
  )
)
