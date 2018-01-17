console.log("Hello from the JavaScript console!");

// Your AJAX request here
console.log("Hello from the JavaScript console!");

$.ajax({
  type: 'GET',
  url: 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=a670b3821658dac9faea685003890b35',
  success(callback) {
    console.log("Here is your weather!");
    console.log(callback);
  },
  error() {
    console.error("Could not locate weather");
  },
});

// Add another console log here, outside your AJAX request

console.log("HELLO.");
