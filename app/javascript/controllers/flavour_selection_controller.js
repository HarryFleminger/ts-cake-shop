import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flavour-selection"
export default class extends Controller {
  static targets = ["flavourLink", "button"]

  connect() {
    // console.log("Flavour selection controller connected")
    // console.log(this.flavourLinkTargets)

  }

  selectFlavour(event) {
    event.preventDefault(this.flavourLinkTargets)
    this.flavourLinkTargets.forEach(link => {
      link.classList.remove("selected")
      link.querySelector("p").classList.add("d-none")
    })
    event.currentTarget.classList.add("selected")
    event.currentTarget.querySelector("p").classList.remove("d-none")
    this.buttonTarget.classList.remove("d-none")
  }

  followLink() {
    window.location.href = this.selectedFlavour.dataset.href
  }

  get selectedFlavour() {
    return this.element.querySelector(".flavour-button.selected a")
  }
}
