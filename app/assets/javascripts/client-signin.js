(function($) {
  "use strict";

  $(document).ready(function() {
    var clientSignin = $(".client-signin");

    $.ajax({
      url: "https://apis.google.com/js/client:plus.js?onload=gpAsyncInit",
      dataType: "script",
      cache: true,
      success: function () {
        clientSignin.show();
      }
    });

    window.gpAsyncInit = function () {
      clientSignin.click(function(e) {
        e.preventDefault();
        gapi.auth.authorize({
          immediate: false,
          response_type: "code",
          cookie_policy: "single_host_origin",
          client_id: clientSignin.data("google-app-id"),
          scope: clientSignin.data("google-app-scope")
        }, function(response) {
          if (response && !response.error) {
            // google authentication succeed, now post data to server.
            jQuery.ajax({
              method: "POST",
              url: clientSignin.data("google-app-callback"),
              dataType: "json",
              data: response,
              success: function(data) {
                // response from server
                window.location = data.redirect_url;
              }
            });
          } else {
            // google authentication failed
          }
        });
      });
    };
  });
})(jQuery);
