requireDir = require 'require-dir'
gulp = require 'gulp'

console.log 'This platform is ' + process.platform
# Require all tasks in gulp/tasks, including subfolders
requireDir './gulp/tasks', { recurse: true }

module.exports = gulp
