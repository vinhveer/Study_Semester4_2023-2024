document.getElementById("registrationForm").addEventListener("submit", function(event){
    event.preventDefault(); // Ngăn form gửi dữ liệu mặc định

    // Lấy giá trị từ các trường input
    var username = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;

    // Kiểm tra xem các trường đã được nhập đúng chưa
    if(username === '' || email === '' || password === ''){
        document.getElementById("message").innerHTML = "Vui lòng điền đầy đủ thông tin!";
    } else {
        // Nếu các trường đã được điền đầy đủ, hiển thị thông báo đăng ký thành công
        document.getElementById("message").innerHTML = "Đăng ký thành công!";
    }
});
