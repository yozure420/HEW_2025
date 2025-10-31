const search = document.getElementById('search');
const hiddenContents = document.querySelectorAll('.hidden-content');
const searchBox = document.querySelector('.search-box');
const hiddenClass = 'hidden';
const hiddenClassHeader = 'hidden-header'
const searchHiddenBox = document.querySelector('.search-hidden-box');
const hiddenContentsHeader = document.querySelectorAll('.hidden-content-header');

hiddenContents.forEach(hidden => {
    search.addEventListener("focus", () => {
        hidden.classList.add(hiddenClass);
        searchHiddenBox.classList.remove(hiddenClass);
        hiddenContentsHeader.forEach(header => {
            header.classList.add(hiddenClassHeader);
        });

        window.scroll({
            top: 0,
            behavior: "smooth",
        });
    });
    search.addEventListener("blur", () => {
        hidden.classList.remove(hiddenClass);
        searchHiddenBox.classList.add(hiddenClass);
        hiddenContentsHeader.forEach(header => {
            header.classList.remove(hiddenClassHeader);
        });
    });
});