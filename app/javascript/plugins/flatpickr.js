import flatpickr from "flatpickr"
require("flatpickr/dist/flatpickr.css")

document.addEventListener("turbolinks:load", () => {
    flatpickr("[data-behavior='flatpickr']", {
        enableTime: true,
        time_24hr: true,
        dateFormat: "Y-m-d H:i",
        // minDate: new Date(),
        defaultDate: new Date(),
    })
})
