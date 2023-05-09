// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import React from "react"
import ReactDOM, { render } from "react-dom"

const select = document.getElementById("mySelect");
const output = document.getElementById("output");

select.addEventListener("change", function() {
  const selectedOption = select.value;

  if (selectedOption === "option1") {
    output.innerHTML = "You selected Option 1";
  } else if (selectedOption === "option2") {
    output.innerHTML = "You selected Option 2";
  } else if (selectedOption === "option3") {
    output.innerHTML = "You selected Option 3";
  } else {
    output.innerHTML = "";
  }
});