import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="increments"
export default class extends Controller {
  static targets = [ "quantity", "show", "price", "basket" ]

  connect() {
    this.basketTarget.value = `Add to basket £` + `${(parseFloat(this.priceTarget.innerHTML) * this.quantityTarget.value).toFixed(2)}`
  }
  increment(event) {
    event.preventDefault()
    if (this.quantityTarget.value < 10) {
      this.quantityTarget.value = parseFloat(this.quantityTarget.value) + 1
      this.showTarget.innerHTML = parseFloat(this.showTarget.innerHTML) + 1
      this.basketTarget.value = `Add to basket £` + `${(parseFloat(this.priceTarget.innerHTML) * this.quantityTarget.value).toFixed(2)}`
    }
  }

  decrement(event) {
    event.preventDefault()
    if (this.quantityTarget.value > 1) {
      this.quantityTarget.value = parseFloat(this.quantityTarget.value) - 1
      this.showTarget.innerHTML = parseFloat(this.showTarget.innerHTML) - 1
      this.basketTarget.value = `Add to basket £` + `${(parseFloat(this.priceTarget.innerHTML) * this.quantityTarget.value).toFixed(2)}`
    }
  }
}
