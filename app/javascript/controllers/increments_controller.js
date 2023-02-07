import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="increments"
export default class extends Controller {
  static targets = [ "quantity", "show", "price", "basket" ]

  connect() {
    this.basketTarget.value = `Add to basket £` + `${parseInt(this.priceTarget.innerHTML) * this.quantityTarget.value}`
  }
  increment(event) {
    event.preventDefault()
    if (this.quantityTarget.value < 10) {
      this.quantityTarget.value = parseInt(this.quantityTarget.value) + 1
      this.showTarget.innerHTML = parseInt(this.showTarget.innerHTML) + 1
      this.basketTarget.value = `Add to basket £` + `${parseInt(this.priceTarget.innerHTML) * this.quantityTarget.value}`
    }
  }

  decrement(event) {

    event.preventDefault()
    if (this.quantityTarget.value > 1) {
      this.quantityTarget.value = parseInt(this.quantityTarget.value) - 1
      this.showTarget.innerHTML = parseInt(this.showTarget.innerHTML) - 1
      this.basketTarget.value = `Add to basket £` + `${parseInt(this.priceTarget.innerHTML) * this.quantityTarget.value}`
    }
  }
}
