import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";

export default class extends Controller {
  connect() {
    console.log("hello world");
    this.sortable = Sortable.create(this.element, {
      animation: 150,
    });
  }
}
