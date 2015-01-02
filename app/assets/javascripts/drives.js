function formModalTrigger(modal,form){
    var modal = document.getElementById(modal);
    var form = document.getElementById(form);
    $(modal).modal({
        closable: true,
        onApprove: function(){
            form.submit();
        },
        onDeny: function(){
            form.reset();
            fileAdded();
        }
    }).modal('show')
}

function fileUpload(){
    $('#added-file').click();
}

function fileAdded(){
    var file=document.getElementById('added-file');
    var label=document.getElementById('file-name');
    if (file != null && label != null ) {
        file.value.length > 0 ? label.textContent = file.value : label.textContent = 'No File Selected';
    }
}