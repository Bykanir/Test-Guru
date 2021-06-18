const { event } = require("jquery")

export default class PasswordConfirmation {

  constructor(table) {
    this.table = table
    this.password = table.user_password
    this.password_confirmation = table.user_password_confirmation

    this.setup()
  }

  removeColour() {
    this.password_confirmation.classList.remove('input-green')
    this.password_confirmation.classList.remove('input-red')
  }

  checkPassword() {
    this.removeColour()
    if(this.password_confirmation.value === this.password.value) {
      this.password_confirmation.classList.add('input-green')
    } else {
      this.password_confirmation.classList.add('input-red')
    }
  }
       
  setup() {
    this.table.addEventListener('keyup', event => {
      if(this.password.value != '') this.checkPassword()
    })
  }
}
