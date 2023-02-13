function check()
{
    if (!document.register.checkbox.checked)
    {
        document.register.ownquestion.disabled = true;
        document.register.securityQuestion.disabled = false;
    } else
    {
        document.register.ownquestion.disabled = false;
        document.register.securityQuestion.disabled = true;
    }
}
function methodCheck(){
    var online = document.getElementById("onn");
     var offline = document.getElementById("offf");
                var ontext = document.getElementById("on");
                var offtext = document.getElementById("off");
                ontext.disabled = online.checked ? false : true;
                offtext.disabled = offline.checked ? false : true;
                ontext.value = "";
                offtext.value = "";
                if (!ontext.disabled) {
                    ontext.focus();
                }
                if (!offtext.disabled) {
                    offtext.focus();
                }
}
function ConfirmDelete(){
    return confirm("are you sure?");
}