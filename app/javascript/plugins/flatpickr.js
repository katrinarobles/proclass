import flatpickr from "flatpickr";

const datePicker = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    time_24hr: true,
    altInput: true,
    altFormat: "F j, Y H:i",
    // mode: "multiple",
    // dateFormat: "M d at H:i D",
    minDate: "today",
  });
  flatpickr(".datepicker2", {
    time_24hr: true,
    altInput: true,
    altFormat: "F j, Y",
    minDate: "today",
  });
};

export { datePicker };
