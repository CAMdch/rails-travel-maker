import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "formactivity", "formtransport", "btn", "btnactivity", "btntransport"]

  connect() {

  }

  delete_form() {
    this.formTarget.classList.add("d-none")
    this.formactivityTarget.classList.add("d-none")
    this.formtransportTarget.classList.add("d-none")
    this.btnTarget.classList.remove("d-none")
    this.btnactivityTarget.classList.remove("d-none")
    this.btntransportTarget.classList.remove("d-none")
  }
}
