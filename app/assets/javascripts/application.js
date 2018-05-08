// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require plugins/jquery/jquery-2.0.0.min
//= require plugins/bootstrap_bundle/bootstrap.bundle.min
//= require plugins/fancybox/fancybox.min
//= require plugins/owlcarousel/owl.carousel.min
//= require plugins/prism/prism
//= require script
//= require toastr
//= require rails-ujs
//= require turbolinks


function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#profile_picture_preview').css('background-image', 'url(' + e.target.result + ')');
            $('#profile_picture_preview').hide();
            $('#profile_picture_preview').fadeIn(650);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
// jquery ready start
$(document).ready(function () {
    
    // Upload preview profile_picture
    $("#signaler_profile_picture").change(function () {
        readURL(this);
    });

    // USe toast for flash messages
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "positionClass": "toast-bottom-right",
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }


    //////////////////////// Menu scroll to section
    $('a.page-scroll').click(function (event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top - 40
        }, 1500);
        event.preventDefault();
    });

    ////////////////////////  Highlight the top nav as scrolling occurs. /bootstrap/
    $('body').scrollspy({
        target: '.nav-sidebar',
        offset: 80
    });

    $('.btn-toggle').click(function () {
        $('body').toggleClass('push-side');
    });
    $('.btn-collapse').click(function () {
        $('.doc-menu').slideToggle();
    });


});
// jquery end

