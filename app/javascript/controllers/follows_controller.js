import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["card"]
  static values = {
    id: Number,
    csrfTokenValue: String,
    payload: String,
    url: {
      type: String,
      default: '/follows'
    },
    headers: Object
  }

  connect() {
    this.#setCsrfToken()
    this.#setPayload()
    this.#setHeaders()
  }

  follow() {
    this.#fetchAndReplace('POST')
  }

  unfollow() {
    this.#fetchAndReplace('DELETE')
  }

  #setCsrfToken() {
    this.csrfTokenValue = document.querySelector("[name='csrf-token']").content
  }

  #setPayload() {
    this.payloadValue = JSON.stringify({ followed_id: this.idValue })
  }

  #setHeaders() {
    this.headersValue = {
      "X-CSRF-Token": this.csrfTokenValue,
      "Content-Type": "application/json"
    }
  }

  #fetchAndReplace(method) {
    fetch(this.urlValue, {
      method: method,
      headers: this.headersValue,
      body: this.payloadValue
    }).then(response => response.text())
      .then(data => this.cardTarget.outerHTML = data)
  }
}
