function documentEvent(e) {
    var ele = e.target;
    var c = ele.getAttribute("class");

    if (c === null) return true;

    var hoverClasses = ['qualtype', 'qualcontent', 'qualestablishment', 'jobtitle', 'jobdescription', 'jobachievementlist', 'jobachievementitem'];
    
    if (hoverClasses.indexOf(c) >= 0) {
        if (ele.style.backgroundColor === 'darkorange') {
            ele.style.backgroundColor = ''; 
            ele.style.backgroundColor = 'darkorange'; 
        }
    }

    return true;
}

document.onclick = documentEvent;
