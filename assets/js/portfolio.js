$(document).ready(function(){
    $(".nav-link").on('click', function(event) {

        if (this.hash !== "") {
            event.preventDefault();

            var hash = this.hash;

            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 700, function(){
                window.location.hash = hash;
            });
        } 
    });

    $("#viewCvBtn").on('click', function(event) {
        event.preventDefault();
        $('html, body').animate({
            scrollTop: $("#cv").offset().top
        }, 700);
    });
    $("#viewCvBtn2").on('click', function(event) {
        event.preventDefault();
        $('html, body').animate({
            scrollTop: $("#cv").offset().top
        }, 700);
    });
    $("#hireMeBtn").on('click', function(event) {
        event.preventDefault();
        window.open("https://www.linkedin.com/in/salma-bouirdi/", "_blank");
    });
});


function changeLanguage(lang) {
    const elements = document.querySelectorAll('[data-i18n]');
    const placeholders = document.querySelectorAll('[data-i18n-placeholder]');
    const rtlSections = document.querySelectorAll('.rtl-section');
    const rtlExceptions = document.querySelectorAll('.rtl-exception');

    elements.forEach(element => {
        const key = element.getAttribute('data-i18n');
        element.innerText = translations[lang][key] || element.innerText;
    });

    placeholders.forEach(element => {
        const key = element.getAttribute('data-i18n-placeholder');
        element.placeholder = translations[lang][key] || element.placeholder;
    });

    if (lang === 'ar') {
        document.documentElement.setAttribute('dir', 'rtl');
        document.documentElement.setAttribute('lang', 'ar');
        rtlSections.forEach(element => {
            element.classList.add('rtl');
        });
        rtlExceptions.forEach(element => {
            element.classList.remove('rtl');
        });
    } else {
        document.documentElement.removeAttribute('dir');
        document.documentElement.setAttribute('lang', lang);
        rtlSections.forEach(element => {
            element.classList.remove('rtl');
        });
    }

    if (player && player.getVideoData) {
        player.setOption('captions', 'track', {'languageCode': lang});
    }

    loadCV(lang);
}

document.addEventListener('DOMContentLoaded', (event) => {
    changeLanguage('fr');
});

let player;
    function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
            height: '720',
            width: '1280',
            videoId: 'ylWGSaAx7gk',
            playerVars: {
                'cc_lang_pref': 'fr',
                'cc_load_policy': 1
            },
            events: {
                'onReady': onPlayerReady
            }
        });
    }

    function onPlayerReady(event) {
    }