import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-update"
export default class extends Controller {
  static targets = ["revealButton", "quantity"]


  connect() {
    this.quantityTarget.addEventListener("change", this.submit.bind(this));
  }

  submit(event) {
    event.preventDefault();
    this.element.submit();
  }
}
