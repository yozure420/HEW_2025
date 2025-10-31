document.addEventListener('DOMContentLoaded', function () {
    const swiper = new Swiper('.swiper', {
        slidesPerView: 5,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev'
        },
        loop: true,
        initialSlide: 1,
        loopAdditionalSlides: 1,
        centeredSlides: true,
        speed: 1000,
        autoplay: {
            delay: 1000,
            disableOnInteraction: false,
            pauseOnMouseEnter: true,
        },
        spaceBetween: 10,
    });
});