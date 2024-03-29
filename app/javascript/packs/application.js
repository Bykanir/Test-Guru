// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("../utilities/sorting")
require("../utilities/password_confirmation")
require("../utilities/form_inline")
require("../utilities/progress_bar")
require("../utilities/timer")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import PasswordConfirmation from "../utilities/password_confirmation"
import ProgressBar from "../utilities/progress_bar"

document.addEventListener('turbolinks:load', () => {
  const table = document.getElementById('new_user')
  if(table) new PasswordConfirmation(table)
})

document.addEventListener('turbolinks:load', function() {
  const progress = document.querySelector('.progress-panel')
  if(progress) new ProgressBar(progress)
})