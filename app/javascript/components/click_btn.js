const btn = document.querySelector("#mybtn")
count = 0;


btn.addEventListener("click", (event) => {
  console.log("event");
});

btn.onclick = function() {
  count += 1;
};
