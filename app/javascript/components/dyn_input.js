const dynInput = () => {
  const checkBox = document.querySelector('input[type=checkbox]');
  const div = document.querySelector(".hidform");
  checkBox.addEventListener('click', (event) => {
    if (checkBox.checked === true){
      console.log("i've been clicked!");
      div.style.display = "block";
    } else {
      console.log('Im unclicked');
      div.style.display = "none";
    }
  })
}

export { dynInput };
