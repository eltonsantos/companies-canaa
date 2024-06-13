import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-submit"
export default class extends Controller {
  static targets = ["form"]

  submit() {
    this.formTarget.requestSubmit()
  }

  clearFilters() {
    this.formTarget.reset()
    window.location.href = this.formTarget.action
  }
}
