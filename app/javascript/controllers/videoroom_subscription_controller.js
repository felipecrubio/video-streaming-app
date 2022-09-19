import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="videoroom-subscription"
export default class extends Controller {
  static values = { videoroomId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "VideoroomChannel", id: this.videoroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )

    console.log(`Subscribe to the videoroom with the id ${this.videoroomIdValue}.`)
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the videoroom")
    this.channel.unsubscribe()
  }
}
