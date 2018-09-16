/* Open the sidenav */
function openNav() {
    let sideNav = document.getElementById("sideNavPanel");
    sideNav.classList.remove("is-hidden-touch");
    
    let closeToggle = document.getElementById("sideNavToggleOff");
    closeToggle.classList.remove("is-hidden-touch");
   
    document.getElementById("sideNavPanel").style.width = "20%";
    document.getElementById("resize-content-container").style.marginLeft = "20%"
}

/* Close/hide the sidenav */
function closeNav() {
    let sideNav = document.getElementById("sideNavPanel");
    sideNav.classList.add("is-hidden-touch");
    
    let closeToggle = document.getElementById("sideNavToggleOff");
    closeToggle.classList.add("is-hidden-touch");

    document.getElementById("sideNavPanel").style.width = "0";
    document.getElementById("resize-content-container").style.marginLeft = "0"
}

function adjustForMobile() {
    let screenWidth = $(document).width();
    if (screenWidth <= 768) {
        //closeNav();
        document.getElementById("resize-content-container").style.marginLeft = "0";
        document.getElementById("footer").style.marginLeft = "0";
    } else {
        let marginSize = Math.max(200, screenWidth * 0.2);
        marginSize = Math.min(250, marginSize);

        document.getElementById("resize-content-container").style.marginLeft = marginSize + "px";
        document.getElementById("footer").style.marginLeft = marginSize + "px";
    }
}

//if we click on something outside of navbar when its open, the navbar closes.
$(document).click(function (event) {
    var dropdownMenu = document.getElementById("webappDropdown");
    // Get element we clicked on
    var clickover = $(event.target);
    // Check if burger is open
    var _opened = $(dropdownMenu).hasClass("is-active");
    // if burger open AND element isn't our menu
    if (_opened === true && !clickover.hasClass("is-active")) {
        var target = $navbarBurgers[0].dataset.target;
        var $target = document.getElementById(target);
        $navbarBurgers[0].classList.toggle('is-active');
        $target.classList.toggle('is-active');
    }
});