function newDriveModal(){
    $('#new-drive-modal').modal({
        closable: true,
        onApprove: function(){
            document.getElementById('new-drive-form').submit();
        }
    }).modal('show');
}

function addStudents(){
    $('#add-students-modal').modal({
        closable: true,
        onApprove: function(){
            document.getElementById('upload-students-list').submit();
        }
    }).modal('show');
}

function formModalTrigger(modal,form){
    var modal = document.getElementById(modal);
    var form = document.getElementById(form);
    $(modal).modal({
        closable: true,
        onApprove: function(){
            form.submit();
        }
    }).modal('show')
}