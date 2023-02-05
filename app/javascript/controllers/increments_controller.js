import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="increments"
export default class extends Controller {
  static targets = ["quantity"];
  connect() {
    console.log("connected!")
    console.log(quantity)
  }

  increment() {
    this.quantityTarget.value = parseInt(this.quantityTarget.value) + 1;
  }

  decrement() {
    this.quantityTarget.value = parseInt(this.quantityTarget.value) - 1;
  }
}
