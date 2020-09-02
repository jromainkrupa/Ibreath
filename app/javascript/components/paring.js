const paring = document.querySelector('#paring')

const initParing = () => {
  if (paring == null)
    return

  setTimeout(() => {
    paring.classList.add('successfully')
  },2000)
}

export { initParing };
