gulp = require 'gulp'
ghPages = require 'gulp-gh-pages'
runSequence = require 'run-sequence'
config = require '../config'
changed = require 'gulp-changed'

gulp.task('deploy:stage', () ->
  runSequence('otherfiles', 'js', 'imgOptimise', 'deploy:gh-stage')
)

gulp.task('deploy:gh-stage', () ->
  return gulp.src(config.path.distpath+'/**/*')
    .pipe(ghPages({
      remoteUrl: 'git@github.com:MirumSG/frontend-coding-practice-tech.git',
      branch: 'master',
      cacheDir: '.release',
      message: 'Tech relase [timestamp]'
    }))
  console.log(chalk.pink('Deploy Successful'))
)
