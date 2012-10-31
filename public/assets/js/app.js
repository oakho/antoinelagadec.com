define(function() {
  return {
    init: function() {
      var $header, $others;

      // UI Elements
      $header = $("#header");
      $others = $("#pageTitle, #yield, #footer");

      // Useful Functions
      var toggleHeader = function toggleHeader(delay, callback) {
        var callback = callback || function(){},
            method   = ($header.css('display') === "none") ? "slideDown" : "slideUp",
            delay    = delay || 0;

        $header.delay(delay)[method](400, "easeOutCubic", callback);
      };

      var toggleOthers = function toggleOthers(delay, callback) {
        var callback = callback || function(){};

        $others.each(function(i, e) {
          var method = ($(this).css('display') === "none") ? "fadeIn" : "fadeOut",
              delay  = (delay || 0) + (200 * i);

          $(this).delay(delay)[method](600, "easeOutCubic", callback);
        });
      };

      // Ingoing Animations
      toggleHeader();
      toggleOthers(200);

      // Navigation Events and Outgoing Animations
      $("a:not([target='_blank'])").on("click", function(e) {
        var self = this;

        toggleOthers();
        toggleHeader(200, function() {
          window.location = $(self).attr('href');
        });

        e.preventDefault();
      });

      // Navigation Active States
      $header.find('a').each(function(i, e) {
        var section  = $(this).attr("href").split("/")[2],
            pathname = window.location.pathname.split("/")[2];

        if(pathname === section) {
          $(this).addClass("active");
        }
      });
    }
  }
});
