import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="increments"
export default class extends Controller {
  static targets = [ "quantity" ]
  connect() {
    console.log("hello world")
  }
  increment(event) {
    event.preventDefault()
    this.quantityTarget.value = parseInt(this.quantityTarget.value) + 1
  }

  decrement(event) {
    event.preventDefault()
    this.quantityTarget.value = parseInt(this.quantityTarget.value) - 1
  }
}
