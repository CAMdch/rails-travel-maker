import { Controller } from "stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

export default class extends Controller {
  static targets = ["start", "end"]

  connect() {
      flatpickr(this.startTarget, {
        altInput: true,
        plugins: [new rangePlugin({ input: this.endTarget})],
        minDate: 'today',
        dateFormat: "Y-m-d",
      });
    }


}
