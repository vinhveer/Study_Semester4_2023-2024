$(document).ready(function () {
    $(".owl-carousel").owlCarousel({
        loop: true,
        margin: 25,
        nav: true,
        center: true,
        autoplay: true,
        smartSpeed: 1000,
        dots: false,
        navText: [
            '<i class="fas fa-chevron-left"></i>',
            '<i class="fas fa-chevron-right"></i>',
        ],
        responsive: {
            0: {
                items: 1,
            },
            768: {
                items: 2,
            },
            992: {
                items: 3,
            },
        },
    });
});