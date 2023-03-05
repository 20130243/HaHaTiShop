$(document).ready(function() {
    var maxSize = 5 * 1024 * 1024; // 5MB
    var maxFiles = 5;
    var $fileInput = $('#image');

    $fileInput.change(function(e) {
        var files = e.target.files;
        var totalSize = 0;
        for (var i = 0; i < files.length; i++) {
            totalSize += files[i].size;
        }
        if (totalSize > maxSize) {
            alert('Dung lượng tất cả các ảnh không được vượt quá 5MB');
            $fileInput.val('');
            return false;
        }
        if (files.length > maxFiles) {
            alert('Bạn chỉ được phép chọn tối đa 5 ảnh');
            $fileInput.val('');
            return false;
        }
    });
});

