import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["produits", "clients", "fournisseurs", "url" ]

  connect() {
    const dash = this.urlTarget.dataset.dash
    const index = this.urlTarget.dataset.index

      if (document.location.href === dash) {
      console.log('ok')
      this.prod()

      } else if (document.location.href === index) {
      console.log('pas ok')
      this.four()
    }

  }



  prod() {
      this.produitsTarget.classList.add("active")
      this.clientsTarget.classList.remove("active")
      this.fournisseursTarget.classList.remove("active")
  }

  four() {
    this.produitsTarget.classList.remove("active")
    this.clientsTarget.classList.remove("active")
    this.fournisseursTarget.classList.add("active")
}

  none() {
    this.produitsTarget.classList.remove("active")
    this.clientsTarget.classList.remove("active")
    this.fournisseursTarget.classList.remove("active")
  }

}
