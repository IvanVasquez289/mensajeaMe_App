// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


window.scroll_bottom = function(){
  if ($('#mensajez').length > 0) {
    $('#mensajez').scrollTop($('#mensajez')[0].scrollHeight);
  }
}

document.addEventListener('turbolinks:load', () => {
    $('.ui.dropdown').dropdown()
    $('.message .close').on('click', function() {
        $(this).closest('.message').transition('fade');
      });
    scroll_bottom();
})


Rails.start()
Turbolinks.start()
ActiveStorage.start()
