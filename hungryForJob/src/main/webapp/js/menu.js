$(document).ready(function () {
    $("#imageUpload").change(function () {
        var isValid = true;
        var file = $(this)[0].files[0];
        var fileType = file.type;
        var fileSize = file.size;

        if (fileType != "image/jpeg" && fileType != "image/jpg") {
            showToast("info","Only JPEG and JPG files are allowed to upload.");
            $(this).val("");
            isValid = false;
            return false;
        }

        if (fileSize > 2097152) { // 2MB
            $('.errorfield').text("File size must be less than 2MB.");
            $('.errorfield').show();
            $(this).val("");
            $('.errorfield').fadeOut(3000);
            isValid = false;
            return false;
        }

        $(".errorfield").text("");
        if (isValid) {
            var formData = new FormData();
            formData.append('image', file);

            $.ajax({
                url: 'updateImage', // Update with your server URL
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    showToast("success","Uploaded successfully.");
                    console.log('File uploaded successfully:', response);
                    location.reload();
                },
                error: function (xhr, status, error) {
                    console.error('Upload failed:', error);
                    showToast("error","Upload failed. Please try again.");
                }
            });
        }
    });
});
