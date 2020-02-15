var gulp = require('gulp');
const shell = require('gulp-shell');
const changedInPlace = require('gulp-changed-in-place');
const changed = require('gulp-changed');
// var del = require('del');

var paths = {
  compile: ['*.scad'], // '**/*.scad',
};

gulp.task('compile', function() {
  // recompile any changed openscad files
  return gulp.src(paths.compile)
             .pipe(changedInPlace({howToDetermineDifference: "modification-time"})) // TODO doesnt work for literally no reason
             .pipe(shell([
              //  'openscad compile/compile.scad -o compile/out.stl > 1'
              'openscad <%= file.relative %> -o <%= file.relative %>.stl'
            ], { ignoreErrors: true }))
});

gulp.task('default', function() {
  gulp.watch(paths.compile, gulp.series('compile'));
});
