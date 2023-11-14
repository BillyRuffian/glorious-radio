import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animator"
export default class extends Controller {
  static targets = [ "animate", "control" ]

  connect() {
  }

  slideDown() {
    const displayedHeight = this.animateTarget.clientHeight
    const contentHeight = this.animateTarget.scrollHeight

    if(displayedHeight < contentHeight ) {
      this.animateTarget.style.height = contentHeight + "px"
      this.controlTarget.textContent = "less"
    }
    else {
      this.animateTarget.style.height = "5rem"
      this.controlTarget.textContent = "more"
    }

    this.animateTarget.classList.toggle("text-transparent")
  }
}
