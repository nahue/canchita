import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ['menu'];
  static values = { open: Boolean, default: false };

  connect() {}

  disconnect() {}

  toggleDropdown() {
    this.menuTarget.classList.toggle('hidden');
  }

  hide(event) {
    if (
      event.target.nodeType &&
      this.element.contains(event.target) === false &&
      'hidden' in this.menuTarget.classList === false
    ) {
      this.menuTarget.classList.add('hidden');
    }
  }

  initialize() {}
}
