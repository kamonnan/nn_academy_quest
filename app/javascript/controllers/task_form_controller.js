import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task-form"
export default class extends Controller {
  static targets = ["input", "submit"]

  connect() {
    this.toggle() // init ตอนโหลด
  }

  toggle() {
    this.submitTarget.disabled = this.inputTarget.value.trim() === ""
  }
}