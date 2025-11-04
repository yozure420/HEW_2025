const hoverElements = document.querySelectorAll('.icon-hover');

hoverElements.forEach(hoverElement => {
    const iconElement = hoverElement.querySelector('.icon-toggle');
    // const background = hoverElement.querySelector('.music-list-thumbnail')

    hoverElement.addEventListener('mouseover', function() {
        if (iconElement) {
            iconElement.classList.remove('fa-music');
            iconElement.classList.add('fa-play');
            iconElement.classList.add('icon-hover-background');
        }
    });

    hoverElement.addEventListener('mouseout', function() {
        if (iconElement) {
            iconElement.classList.remove('fa-play');
            iconElement.classList.add('fa-music');
            iconElement.classList.remove('icon-hover-background');
        }
    });
});