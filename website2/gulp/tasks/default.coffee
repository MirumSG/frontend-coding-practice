gulp = require 'gulp'
config = require '../config'
del = require 'del'
chalk = require 'chalk'
runSequence = require 'run-sequence'
fs = require 'fs'

gulp.task('default', ['clean'], (cb) ->
  console.log(chalk.magenta.inverse('» Building for development...'))
  runSequence(['bower', 'copy', 'pug', 'sass', 'ts', 'watch'])
)

gulp.task('clean', () ->
  console.log(chalk.magenta.inverse('» Deleting...'))
  del.sync([config.path.distpath, '!*.git'], {force: true}, (err, deletedFiles) ->
    if err
      console.log(chalk.red('Error deleting files: '+err))
  )
)
