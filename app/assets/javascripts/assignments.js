
var ready = function () {
 
    changePhase = {

        change: function(oldphase, currentphase) {
            if(oldphase == 0 && currentphase == 1){
                $.ajax({
                    type:$("#submission_form").attr("method"),
                    url: $("#submission_form").attr("action"),
                    data: $("#submission_form").serialize(),
                    success:function(message){
                        window.location.reload();
                    }
                });
            }
            else if(oldphase == 1 && currentphase == 2){
                var editor1 = ace.edit("editor1");
                var code = editor1.getSession().getValue();
                var length = editor1.session.getLength();
                $("#length_field").val(length);
                $("#content_field").val(code);
                $.ajax({
                    type:$("#submission_form").attr("method"),
                    url: $("#submission_form").attr("action"),
                    data: $("#submission_form").serialize(),
                    success:function(message){
                        window.location.reload();
                    }
                });
            }
            else if(oldphase == 2 && currentphase == 3){
                $.ajax({
                    type:$("#comment_form").attr("method"),
                    url: $("#comment_form").attr("action"),
                    data: $("#comment_form").serialize(),
                    success:function(message){
                        window.location.reload();
                    }
                });
            }
            else if(oldphase == 3 && currentphase == 4){
                window.location.reload();
            }
            else if(oldphase == 4 && currentphase == 5){
                window.location.reload();
            }
            else if(oldphase == 5 && currentphase == 6){
                console.log($("#note_form").serialize());
                $.ajax({
                    type:$("#note_form").attr("method"),
                    url: $("#note_form").attr("action"),
                    data: $("#note_form").serialize(),
                    success:function(message){
                        window.location.reload();
                    }
                });
            }
            else if(oldphase == 6 && currentphase == 0){
                $.ajax({
                    type:$("#submission_form").attr("method"),
                    url: $("#submission_form").attr("action"),
                    data: $("#submission_form").serialize(),
                    success:function(message){
                        window.location.replace('/');
                    }
                });
                
            }
            else if(oldphase == 6 && currentphase == 5){
                $.ajax({
                    type:$("#submission_form").attr("method"),
                    url: $("#submission_form").attr("action"),
                    data: $("#submission_form").serialize(),
                    success:function(message){
                        window.location.reload();
                    }
                });
            }
            else if(oldphase == 5 && currentphase == 4){
                $.ajax({
                    type:$("#note_form").attr("method"),
                    url: $("#note_form").attr("action"),
                    data: $("#note_form").serialize(),
                    success:function(message){
                        window.location.reload();
                    }
                });
            }
            else if(oldphase == 4 && currentphase == 3){
                window.location.reload();
            }
            else if(oldphase == 3 && currentphase == 2){
                window.location.reload();
            }
            else if(oldphase == 2 && currentphase == 1){
                $.ajax({
                    type:$("#comment_form").attr("method"),
                    url: $("#comment_form").attr("action"),
                    data: $("#comment_form").serialize(),
                    success:function(message){
                        window.location.reload();
                    }
                });
            }
            else if(oldphase == 1 && currentphase == 0){
                var editor1 = ace.edit("editor1");
                var code = editor1.getSession().getValue();
                var length = editor1.session.getLength();
                $("#length_field").val(length);
                $("#content_field").val(code);
                $.ajax({
                    type:$("#submission_form").attr("method"),
                    url: $("#submission_form").attr("action"),
                    data: $("#submission_form").serialize(),
                    success:function(message){
                        window.location.reload();
                    }
                });
            }
        }
    };
 
 
}
 
$(document).ready(ready);
$(document).on("page:load", ready);