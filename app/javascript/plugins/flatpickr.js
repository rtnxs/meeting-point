import flatpickr from "flatpickr"
require("flatpickr/dist/flatpickr.css")

document.addEventListener("turbolinks:load", () => {
    flatpickr("[data-behavior='flatpickr']", {
        enableTime: true,
        time_24hr: true,
        dateFormat: "d-m-Y H:i",
        minDate: new Date(),
    })
})
