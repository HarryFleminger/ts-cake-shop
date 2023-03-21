import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-selector"
export default class extends Controller {
  connect() {
    console.log("connected to form selector")
  }
}
