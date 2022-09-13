// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("@nathanvda/cocoon")
require("packs/jquery.raty")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//= require ckeditor/init

import "bootstrap"
import "./img_js"
window.jQuery = window.$ = jQuery;

$(document).on('turbolinks:load', function() {
  $('.review-rating').raty({
    readOnly: true,
    score: function(){
      return $(this).attr('data-score');
    },
    path: '/images/ratyrate'
  });

  $(".average-review-rating").raty({
    readOnly: true,
    path: '/images/ratyrate',
    score: function(){
      return $(this).attr("data-score")
    }
  });

  $("#sidebarCollapse").on("click", function() {
    $("#sidebar").toggleClass("active");
    $(this).toggleClass("active");
  });

  $('.carousel-home').owlCarousel({
    loop:true,
    nav:true,
    margin:10,
    navText:["<i class='fa fa-chevron-left'></i>", "<i class='fa fa-chevron-right'></i>"],
    responsive:{
        0:{
            items:1
        },
        500:{
            items:6
        },
        1000:{
            items:7
        }
    }
  })

  $('.owl-carousel').owlCarousel({
    loop:true,
    nav:true,
    margin:10,
    autoplay: true,
    autoplayTimeout: 3000,
    navText:["<i class='fa fa-chevron-left'></i>", "<i class='fa fa-chevron-right'></i>"],
    responsive:{
        0:{
            items:1
        },
        750:{
            items:5
        },
        1000:{
            items:6
        }
    }
  })
})
