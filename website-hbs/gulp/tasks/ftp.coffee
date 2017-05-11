#-- Plugins requires
#
gulp = require 'gulp'
config = require '../config'
gutil = require 'gulp-util'
chalk = require 'chalk'
ftp = require 'vinyl-ftp'

gulp.task('ftp', () ->
  console.log(chalk.blue('» Uploading Staging files:'))
  conn = ftp.create( {
    host:     'stb.xm-worldwide.com',
    user:     'stb',
    password: 'Xb95w3PN',
    parallel: 10,
    log: gutil.log
  } )

  globs = [
    './stage/**'
  ]

  return gulp.src( globs, { base: './stage', buffer: false } )
    .pipe( conn.newer( '/stb/btmice2015' ) ) # only upload newer files
    .pipe( conn.dest( '/stb/btmice2015' ) )
)
