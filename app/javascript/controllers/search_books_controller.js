import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-books"
export default class extends Controller {
  static targets = ["form", "input", "list"]

  connect() {
    console.log(this.formTarget)
    console.log(this.inputTarget)
  }

  update() {
    if (this.inputTarget.value.length < 2) {
      return;
    }

    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.innerHTML = data
    })
  }
}
