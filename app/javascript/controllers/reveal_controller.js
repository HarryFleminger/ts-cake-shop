import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reveal"
export default class extends Controller {
  static targets = ["revealButton"]

  reveal(event){
    const id = event.target.id
    const revealButtonTarget = this.revealButtonTargets[parseInt(id)]
    if (revealButtonTarget.classList.contains("hide")) {
      revealButtonTarget.classList.remove("hide")
      event.target.classList.add("icon-down")
    } else {
      revealButtonTarget.classList.add("hide")
      event.target.classList.add("icon-right")
      event.target.classList.remove("icon-down")
    }
  }
}
