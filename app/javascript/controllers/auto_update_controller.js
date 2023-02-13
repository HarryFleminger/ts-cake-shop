import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-update"
export default class extends Controller {
  static targets = ["quantity", "show"]


  connect() {
    this.quantityTarget.addEventListener("input", this.submit.bind(this));
  }

  submit(event) {
    event.preventDefault();
    this.element.submit();
  }

  increment(event) {
    event.preventDefault()
    if (this.quantityTarget.value < 10) {
      this.quantityTarget.value = parseInt(this.quantityTarget.value) + 1
      this.element.submit();
    }
  }

  decrement(event) {
    event.preventDefault()
    if (this.quantityTarget.value > 1) {
      this.quantityTarget.value = parseInt(this.quantityTarget.value) - 1
      this.element.submit();
    }
  }
}
