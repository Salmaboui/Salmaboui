function loadCV(lang = 'fr') {
    var xmlFile = 'assets/cv/cv.xml';
    var xsltFile = 'assets/cv/cv.xslt';

    var xhttp = new XMLHttpRequest();
    xhttp.open('GET', xmlFile, true);
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var xml = xhttp.responseXML;
            transformXML(xml, xsltFile, lang);
        }
    };
    xhttp.send();
}

function transformXML(xml, xsltFile, lang) {
    var xhttp = new XMLHttpRequest();
    xhttp.open('GET', xsltFile, true);
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var xslt = xhttp.responseXML;

            var processor = new XSLTProcessor();
            processor.importStylesheet(xslt);

            processor.setParameter(null, 'lang', lang);

            var resultDocument = processor.transformToFragment(xml, document);
            document.getElementById('cv-container').innerHTML = '';
            document.getElementById('cv-container').appendChild(resultDocument);
            
            if (lang === 'ar') {
                document.documentElement.setAttribute('dir', 'rtl');
                document.documentElement.setAttribute('lang', 'ar');
                document.body.classList.add('rtl');
            } else {
                document.documentElement.setAttribute('dir', 'ltr');
                document.documentElement.setAttribute('lang', lang);
                document.body.classList.remove('rtl');
            }
        }
    };
    xhttp.send();
}

window.onload = function() {
    loadCV('fr'); 
};
