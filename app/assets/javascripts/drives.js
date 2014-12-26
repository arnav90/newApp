function newDriveModal(){
    $('#new-drive-modal').modal({
        closable: true,
        onApprove: function(){
            document.getElementById('new-drive-form').submit();
        }
    }).modal('show');
};