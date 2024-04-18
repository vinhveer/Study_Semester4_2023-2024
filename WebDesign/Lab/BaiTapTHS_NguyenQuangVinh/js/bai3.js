// Lấy tất cả các nút bấm phép tính
var operatorButtons = document.querySelectorAll('#operatorButtons button');

// Lặp qua từng nút bấm và thêm sự kiện click
operatorButtons.forEach(function(button) {
    button.addEventListener('click', function() {
        // Gọi hàm calculate() khi người dùng chọn một phép tính
        calculate(button.value); // Truyền giá trị của nút bấm vào hàm calculate
    });
});

function calculate(operator) {
    var num1 = parseFloat(document.getElementById('num1').value);
    var num2 = parseFloat(document.getElementById('num2').value);

    var result;
    switch (operator) {
        case 'add':
            result = num1 + num2;
            break;
        case 'subtract':
            result = num1 - num2;
            break;
        case 'multiply':
            result = num1 * num2;
            break;
        case 'divide':
            if (num2 === 0) {
                document.getElementById('result').innerHTML = "Cannot divide by zero!";
                return;
            }
            result = num1 / num2;
            break;
        default:
            document.getElementById('result').innerHTML = "Please select an operator!";
            return;
    }

    document.getElementById('result').innerHTML = "Result: " + result;
}
