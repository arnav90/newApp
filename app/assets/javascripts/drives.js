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

function fileUpload(){
    $('#added-file').click();
}
