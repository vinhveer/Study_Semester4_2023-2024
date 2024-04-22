function changeContent() {
    // Change content
    document.getElementById('heading').innerHTML = 'New Heading';
}

function changeStyle() {
    // Change background color for all elements with class 'heading'
    var headings = document.getElementsByClassName('heading');
    for (var i = 0; i < headings.length; i++) {
        headings[i].style.backgroundColor = '#101010';
    }
    
    // Change text color for the element with id 'heading'
    var heading = document.getElementById('heading');
    heading.style.color = '#ff0000';
}
