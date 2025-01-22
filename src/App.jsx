import "./App.css";
import axios from "axios";
import React, { useState } from "react";

function App() {
  console.log("TEST!");
  const [city, setCity] = useState("");
  const [weatherData, setWeatherData] = useState(null);
  const [error, setError] = useState("");

  const handleChange = (event) => {
    setCity(event.target.value);
  };
  const handleSubmit = async (event) => {
    event.preventDefault();
    setError("");
    setWeatherData(null);

    if (!city.trim()) {
      setError("Please enter a city name!");
      return;
    }

    try {
      const response = await axios.get(
        `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=bf960caa19fce81197c6d7b931ebb206`
      );

      setWeatherData(response.data);
    } catch (err) {
      setError("City not found or API error occurred.");
    }
  };

  return (
    <body>
      <div className="weather-search-container">
        <h1 className="heading-main">Weather App</h1>
        <form id="weatherForm" onSubmit={handleSubmit}>
          <input
            type="text"
            id="cityInput"
            value={city}
            onChange={handleChange}
            placeholder="Enter city name"
            aria-label="City Input"
          />
          <button type="submit" disabled={!city.trim()}>
            Search
          </button>
        </form>
        <div className="messages">
          {error && <p className="error">{error}</p>}
          {weatherData && (
            <div className="weather-result">
              <h2>{weatherData.name}</h2>
              <p>
                Temperature: {(weatherData.main.temp - 273.15).toFixed(1)} °C
              </p>
              <p>Weather: {weatherData.weather[0].description}</p>
              <p>Country: {weatherData.sys.country}</p>
            </div>
          )}
        </div>
      </div>
    </body>
  );
}

export default App;
