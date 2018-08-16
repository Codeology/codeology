function navBarPopulate(){ 
    // Get all "navbar-burger" elements
    var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
  
    // Check if there are any navbar burgers
    if ($navbarBurgers.length > 0) {
  
        // Add a click event on each of them
        $navbarBurgers.forEach(function ($el) {
            $el.addEventListener('click', function () {
    
            // Get the target from the "data-target" attribute
            var target = $el.dataset.target;
            var $target = document.getElementById(target);
    
            // Toggle the class on both the "navbar-burger" and the "navbar-menu"
            $el.classList.toggle('is-active');
            $target.classList.toggle('is-active');
    
            });
        });
    }
    
    //if we click on something outside of navbar when its open, the navbar closes.
    $(document).click(function (event) {
        var navbarBurger = $navbarBurgers[0];
        // Get element we clicked on
        var clickover = $(event.target);
        // Check if burger is open
        var _opened = $(navbarBurger).hasClass("is-active");
        // if burger open AND element isn't our menu
        if (_opened === true && !clickover.hasClass("is-active")) {
            var target = $navbarBurgers[0].dataset.target;
            var $target = document.getElementById(target);
            $navbarBurgers[0].classList.toggle('is-active');
            $target.classList.toggle('is-active');
        }
    });
};