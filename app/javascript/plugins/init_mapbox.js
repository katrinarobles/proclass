import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const links = document.querySelectorAll('#event-link');

  const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };
  const flyToEvent = (map, marker) => {
      map.flyTo({
        center: [ marker.lng, marker.lat ],
        zoom: 15,
        essential: true
      });
  }

  const createPopUp = (map, marker) => {
      var popUps = document.getElementsByClassName('mapboxgl-popup');
      /** Check if there is already a popup on the map and if so, remove it */
      if (popUps[0]) popUps[0].remove();

      const popup = new mapboxgl.Popup({ closeOnClick: false })
        .setLngLat([ marker.lng, marker.lat ])
        .setHTML(marker.infoWindow)
        .addTo(map);
  }


  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);

        links.forEach((link) => {
          link.addEventListener('click', (event) => {
            for (let i=0; i < markers.length; i++) {
                if (this.id === markers[i].id) {
                  let clickedListing = markers[i];
             flyToEvent(clickedListing);
             createPopUp(clickedListing);
                }
            }
          })
        });

        // const activeItem = document.getElementsByClassName('active');
        //   if (activeItem[0]) {
        //     activeItem[0].classList.remove('active');
        //   }
        //   this.parentNode.classList.add('active');
    });
    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));


  }
};


export { initMapbox };
