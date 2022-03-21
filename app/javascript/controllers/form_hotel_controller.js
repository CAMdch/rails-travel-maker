import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['form', 'btn', 'formactivity', 'btnactivity','form_edit', 'formactivityedit']

  connect() {

  }

  display() {
    this.formTarget.classList.remove("d-none")
    this.btnTarget.classList.add("d-none")
    this.btnactivityTarget.classList.add("d-none")
  }

  displayactivity() {
    this.formactivityTarget.classList.remove("d-none")
    this.btnactivityTarget.classList.add("d-none")
    this.btnTarget.classList.add("d-none")
  }

  display_edit(event) {
    this.form_editTargets.forEach(target => {
      if (target.id === event.currentTarget.dataset.choice) {
        target.classList.remove("d-none")
      }
      })
  }

  displayactivity_edit() {
    this.formactivityeditTarget.classList.remove("d-none")
  }
}
