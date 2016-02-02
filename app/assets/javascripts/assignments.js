
var ready = function () {
 
    changePhase = {

        change: function(oldphase, currentphase) {
            if(oldphase == 0 && currentphase == 1){
                $("#submission_form").submit();
            }
            else if(oldphase == 1 && currentphase == 2){
                var editor1 = ace.edit("editor1");
                var code = editor1.getSession().getValue();
                var length = editor1.session.getLength();
                $("#length_field").val(length);
                $("#content_field").val(code);
                $("#submission_form").submit();
            }
            else if(oldphase == 2 && currentphase == 3){
                $("#comment_form").submit();
            }
            else if(oldphase == 3 && currentphase == 4){
                window.location.reload();
            }
            else if(oldphase == 4 && currentphase == 5){
                window.location.reload();
            }
            else if(oldphase == 5 && currentphase == 6){
                $("#note_form").submit();
            }
            else if(oldphase == 6 && currentphase == 0){
                $("#submission_form").submit();
                window.location.replace('/');
            }
            else if(oldphase == 6 && currentphase == 5){
                $("#submission_form").submit();
            }
            else if(oldphase == 5 && currentphase == 4){
                $("#note_form").submit();
            }
            else if(oldphase == 4 && currentphase == 3){
                window.location.reload();
            }
            else if(oldphase == 3 && currentphase == 2){
                window.location.reload();
            }
            else if(oldphase == 2 && currentphase == 1){
                $("#comment_form").submit();
            }
            else if(oldphase == 1 && currentphase == 0){
                var editor1 = ace.edit("editor1");
                var code = editor1.getSession().getValue();
                var length = editor1.session.getLength();
                $("#length_field").val(length);
                $("#content_field").val(code);
                $("#submission_form").submit();
            }
        }
    };
 
 
}
 
$(document).ready(ready);
$(document).on("page:load", ready);