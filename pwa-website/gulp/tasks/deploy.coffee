gulp = require 'gulp'
ghPages = require 'gulp-gh-pages'
runSequence = require 'run-sequence'
config = require '../config'
changed = require 'gulp-changed'
chalk = require 'chalk'

gulp.task('deploy:stage', () ->
  runSequence('otherfiles', 'js', 'imgOptimise', 'deploy:gh-stage')
)

gulp.task('deploy:gh-stage', ['build'], () ->
  console.log(chalk.magenta.inverse('» Deploying to github'))
  return gulp.src(config.path.distpath+'/clientlib-site/**/*')
    .pipe(ghPages({
      # remoteUrl: 'git@github.com:MirumSG/BrandsWorld-RMD.git',
      branch: 'tech',
      cacheDir: '.release',
      message: 'Tech relase'
    }))
  console.log(chalk.pink('Deploy Successful'))
)
