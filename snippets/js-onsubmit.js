$(document).on('submit', '.form', function(e) {
    e.preventDefault();
})

$(document).on('submit', '#form', function(e) {
    e.preventDefault();
    var callurl = baseUrl + "uu"
    var data = new FormData(this)
    ajaxer.post( callurl, data, function(response){
        if(response.success){
            
        }else{
            alert(response.message)
        }
    })
})