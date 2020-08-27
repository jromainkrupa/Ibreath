const clickBtn = () => {
  const btn = document.querySelector("#mybtn")
  if (btn) {
    let count = 0;

    btn.addEventListener("click", (event) => {
      console.log("event");
    });
  
    btn.onclick = function() {
      count += 1;
    };
  }
}

export { clickBtn };