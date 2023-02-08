import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reveal"
export default class extends Controller {
  static targets = ["revealButton"]

  connect() {
    console.log("Connected!")
    console.log(this.revealButtonTarget.classList)
  }


  reveal(event){
    if (this.revealButtonTarget.classList.contains("hide")) {
      this.revealButtonTarget.classList.remove("hide")
    } else {
      this.revealButtonTarget.classList.add("hide")
    }
    console.log(event.target.classList)
  }
}
