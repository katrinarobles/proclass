import places from 'places.js'

var placesAutocomplete = places({
    appId: 'pl2D90J3MAUF',
    apiKey: 'f5a073a24d2cbe323f3ad10c577e562a',
    container: document.querySelector('.address-input')
});

export { placesAutocomplete } ;
