gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
browserSync = require 'browser-sync'
pug = require 'gulp-pug'
dummyData = require '../../dummy-data/data.json'
handlebars = require 'handlebars';
# gulpHandlebars = require('gulp-compile-handlebars')(handlebars);
# gulpHandlebars = require('gulp-handlebars-html')(handlebars);
through2 = require 'through2'

gulp.task('pug', ['pug-partials', 'pug-components'], () ->
  console.log(chalk.magenta.inverse('processing pug files'))

  # commonTemplateData =
  optionsHandlebar = {

  };

  return gulp.src([config.path.src + '/html/templates/*.pug'])
    .pipe(pug({
      pretty: true,
      data: dummyData,
      locals: dummyData
    }))
    .pipe(through2.obj((file, enc, cb) ->
      console.log(file.path)
      templateData = require('../../dummy-data/' + path.basename(file.path, '.html') + '.json')
      templateData = require('../../dummy-data/helloworld.json')

      fileContents = file.contents.toString()
      if file.data
        templateData = extend(templateData, file.data);

      template = handlebars.compile(fileContents)
      file.contents = new Buffer(template(templateData))

      cb(null, file)
    ))
    .on('error', handleErrors)
    .pipe(gulp.dest(config.path.dist))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)

gulp.task('pug-partials', () ->
  console.log(chalk.magenta.inverse('compiling pug partial files'))

  templateData = {
    firstName: 'Kaanon'
  };
  options = {

  };

  return gulp.src([config.path.src + '/html/components/*-partial.pug', config.path.src + '/html/molecules/*-partial.pug'])
    .pipe(pug({
      debug: false,
      client: true,
      inlineRuntimeFunctions: true,
      pretty: true,
      #name: 'templateTest',
      data: {
        partial: true,
        analytics: dummyData.analytics
      }
    }))
    # .pipe(gulpHandlebars(templateData, options))
    .on('error', handleErrors)
    .pipe(gulp.dest(config.path.dist + config.path.etc_designs + config.projName + '/assets/js/partials'))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)

gulp.task('pug-components', () ->
  console.log(chalk.magenta.inverse('compiling pug components files'))

  optionsHandlebar = {}

  return gulp.src([config.path.src + '/html/components/**/*.pug'])
    .pipe(pug({
      pretty: true,
      data: dummyData,
      locals: dummyData
    }))
    # .pipe(through2.obj((file, enc, cb) ->
    #     console.log(file.path)
    #     templateData = require('../../dummy-data/' + path.basename(file.path, '.html') + '.json')
    #     cb(null, gulpHandlebars(templateData, optionsHandlebar))
    #   ))
    .on('error', handleErrors)
    .pipe(gulp.dest(config.path.dist + config.path.apps + config.projName + '/components'))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
