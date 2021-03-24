import $ from 'jquery';

const openWeather = () => {
  const apiKey = "<%= ENV['OPENWEATHER_API_KEY'] %>";
  const result = document.querySelector(".report");

  const updateCard = (data) => {
    const temp = Math.round(data.main.temp) - 273;
    const today = new Date();
    const localOffset = data.timezone + today.getTimezoneOffset() * 60;
    const localDate = new Date(today.setUTCSeconds(localOffset));
    const options = {
      weekday: 'long', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric'
    };
    const formattedDate = localDate.toLocaleDateString("en-US", options);
    result.innerHTML = `<small> ${formattedDate} ${temp}°C <img src="https://openweathermap.org/img/w/${data.weather[0].icon}.png" class="weather-icon"></small>`;
  };

  const fetchWeatherByCoordinates = (coordinates) => {
    fetch(`http://api.openweathermap.org/data/2.5/weather?lat=${coordinates.lat}&lon=${coordinates.lon}&appid=${apiKey}`)
      .then(response => response.json())
      .then(updateCard);
  };


  const fetchCurrentPositionWeather = () => {
    navigator.geolocation.getCurrentPosition((data) => {
      fetchWeatherByCoordinates({ lat: data.coords.latitude, lon: data.coords.longitude });
    })
  };
  fetchCurrentPositionWeather();
};

export { openWeather };
