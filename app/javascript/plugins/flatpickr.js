import flatpickr from "flatpickr";

const datePicker = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    time_24hr: true,
    altInput: true,
    altFormat: "F j, Y D H:i",
    mode: "multiple",
    dateFormat: "D M d at H:i",
  });
};

export { datePicker };
