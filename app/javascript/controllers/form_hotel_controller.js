import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['form', 'btn']

  connect() {

  }

  display() {
    this.formTarget.classList.remove("d-none")
    this.btnTarget.classList.add("d-none")
  }
}
