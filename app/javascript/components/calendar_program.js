/* const day = document.querySelectorAll(".calendar-day");
console.log(day)
  day.addEventListener("click", (event) => {
    console.log("event");
  }); */



const days = document.querySelectorAll(".calendar-day")
const dailyCigs = document.querySelector("#daily-cigs")
const dayContent = ""

const calendarDay = () => {
  if (days) {
    days.forEach(day => 
      day.addEventListener("click", (event) => {
        console.log(day.dataset.numCig),
        dailyCigs.innerHTML = `Today you should smoke <span class="text-blue-500">${parseInt(day.dataset.numCig, 10) + 1}</span> cigarettes`;
      })
    )
  }
}

export { calendarDay };
