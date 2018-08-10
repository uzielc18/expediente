/*
* Dependencias
*/
var gulp = require('gulp'),
  concat = require('gulp-concat'),
  uglify = require('gulp-uglify'),
  gutil = require('gulp-util');

/*
* Configuración de la tarea 'expediente_min'
*/
gulp.task('admin-css', function () {
  gulp.src('default/public/css/backendnew/AdminLTE.css')
  .pipe(concat('AdminLTE.min.css'))
  .pipe(uglify())
  .pipe(gulp.dest('default/public/css/backendnew/'))
});