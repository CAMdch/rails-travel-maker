import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['form', 'btn', 'formactivity', 'btnactivity', 'formtransport', 'btntransport', 'form_edit', 'form_activity_edit', 'form_transport_edit']

  connect() {

  }

  display() {
    this.formTarget.classList.remove("d-none")
    this.btnTarget.classList.add("d-none")
    this.btnactivityTarget.classList.add("d-none")
    this.btntransportTarget.classList.add("d-none")
  }

  displayactivity() {
    this.formactivityTarget.classList.remove("d-none")
    this.btnactivityTarget.classList.add("d-none")
    this.btnTarget.classList.add("d-none")
    this.btntransportTarget.classList.add("d-none")
  }

  displaytransport() {
    this.formtransportTarget.classList.remove("d-none")
    this.btnactivityTarget.classList.add("d-none")
    this.btnTarget.classList.add("d-none")
    this.btntransportTarget.classList.add("d-none")
  }

  display_edit(event) {
    this.form_editTargets.forEach(target => {
      if (target.id === event.currentTarget.dataset.choice) {
        target.classList.remove("d-none")
      }
      })
  }

  display_activity_edit(event) {
    console.log(this.form_activity_editTarget.id)
    this.form_activity_editTargets.forEach(target => {
      if (target.id === event.currentTarget.dataset.choice) {
        target.classList.remove("d-none")
      }
      })
  }

  display_transport_edit(event) {
    console.log(this.form_transport_editTarget.id)
    this.form_transport_editTargets.forEach(target => {
      if (target.id === event.currentTarget.dataset.choice) {
        target.classList.remove("d-none")
      }
      })
  }
}
