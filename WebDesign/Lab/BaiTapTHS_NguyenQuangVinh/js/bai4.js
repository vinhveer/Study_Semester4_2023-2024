let slideIndex = 0;
showSlides();

function showSlides() {
    let slides = document.querySelectorAll(".slider-images img");
    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }

    if (slideIndex >= slides.length) {
        slideIndex = 0;
    }

    slides[slideIndex].style.display = "block";
    slideIndex++;

    setTimeout(showSlides, 4000); // Gọi lại hàm showSlides() sau mỗi 2 giây
}

function nextSlide() {
    slideIndex++;
    showSlides();
}

function prevSlide() {
    slideIndex--;
    if (slideIndex < 0) {
        slideIndex = document.querySelectorAll(".slider-images img").length - 1;
    }
    showSlides();
}