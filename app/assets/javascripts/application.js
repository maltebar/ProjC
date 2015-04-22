// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require ace-builds/src-noconflict/ace
//= require turbolinks
//= require_tree .

jQuery(document).ready(function() {
  setTimeout(function() {
    var source = new EventSource('/browser');
    source.addEventListener('phase0to1', function(e) {
      $("#submission_form").submit();
    });
    source.addEventListener('phase1to2', function(e) {
      var editor1 = ace.edit("editor1");
      var code = editor1.getSession().getValue();
      $("#content_field").val(code);
      $("#submission_form").submit();
    });
    source.addEventListener('phase2to3', function(e) {
      window.location.reload();
    });
    source.addEventListener('phase3to4', function(e) {
      window.location.reload();
    });
    source.addEventListener('phase4to5', function(e) {
      window.location.reload();
    });
    source.addEventListener('phase5to6', function(e) {
      window.location.reload();
    });
    source.addEventListener('phase6to0', function(e) {
      $("#submission_form").submit();
    });
    source.addEventListener('phase6to5', function(e) {
      window.location.reload();
    });
    source.addEventListener('phase5to4', function(e) {
      window.location.reload();
    });
    source.addEventListener('phase4to3', function(e) {
      window.location.reload();
    });
    source.addEventListener('phase3to2', function(e) {
      window.location.reload();
    });
    source.addEventListener('phase2to1', function(e) {
      window.location.reload();
    });
    source.addEventListener('phase1to0', function(e) {
      var editor1 = ace.edit("editor1");
      var code = editor1.getSession().getValue();
      $("#content_field").val(code);
      $("#submission_form").submit();
    });
  }, 1);
});
