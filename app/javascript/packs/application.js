// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { datePicker } from '../plugins/flatpickr';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { dynInput } from '../components/dyn_input';
import { textified } from '../components/textify';
import { initMapbox } from '../plugins/init_mapbox';
import { openWeather } from '../plugins/open_weather';
import { initChatroomCable } from '../channels/chatroom_channel';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  datePicker();
  initUpdateNavbarOnScroll();
  initMapbox();
  initChatroomCable();

  const report = document.querySelector(".report")
  if(report) {
    openWeather();
  };

  const bounce = document.querySelector('.bounce');
  if(bounce) {
    textified(bounce,'bounce',5500);
  }
  const registration = document.getElementById('registration');

  if(registration){
    dynInput();
  }

  const alert = document.querySelector('.alert');

  if(alert){
    setTimeout(function(){
      alert.remove();
    }, 4000);
  }

  const addressInput =  document.querySelector('.address-input')
  if (addressInput) {
    var places = require('places.js');
    var placesAutocomplete = places({
      apiKey: "f5a073a24d2cbe323f3ad10c577e562a",
      container: addressInput,
    });
  }

});


