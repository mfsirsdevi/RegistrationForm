function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        addImageDiv();
        reader.onload = function (e) {
            $(document).find('#img-holder').attr('src', e.target.result);
        }
        
        reader.readAsDataURL(input.files[0]);
    }
}

function addImageDiv() {
    var addHTML = '<div><img id="img-holder" src="#" alt="your image" /></div><div class="btn-box"><button id="sbt-btn" class="btn btn-primary">Submit</button><button id="cancel-btn" class="btn btn-default pull-right">Cancel</button></div>';
    $("#img-preview").empty();
    $("#img-preview").append(addHTML);
}

function addParagraph() {
    var addHTML = '<p>Preview Section</p>';
    $("#img-preview").empty();
    $("#img-preview").append(addHTML);
}
    
$("#imgInp").change(function(){
    readURL(this);
});

$(document).on("click", "#cancel-btn", function() {
    $("#img-form")[0].reset();
    addParagraph();
});
//chaining
$(document).on("click", "#sbt-btn", function() {
    var formData = new FormData($("#img-form")[0]);
    $.ajax({
        type: "post",
        url: "../../controller/ImageController.cfc?method=uploadImage",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(data) {
            var responseObj = $.parseJSON(data);
            if (responseObj.SUCCESS) {
                console.log('success');
            }
            else {
                console.log('failure');
            }
            $("#cancel-btn").trigger("click");
        }
    });
});

