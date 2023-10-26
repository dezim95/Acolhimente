import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "user", "volunteer" ]

  redirect(event) {
    if (event.target == this.userTarget) {
      // Redirect to the user registration view
      window.location.href = "/users/registrations/user"
    } else if (event.target == this.volunteerTarget) {
      // Redirect to the volunteer registration view
      window.location.href = "/users/registrations/volunteer"
    }
  }
}
