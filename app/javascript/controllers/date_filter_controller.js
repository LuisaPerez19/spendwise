import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dateFilter", "totalExpenses"];
  connect() {
    console.log("Hello, from your stimulus controller");
    this.updateTotalExpenses();
  }

  updateDateFilter(event) {
    const selectedOption = event.target.value;
    this.element.dispatchEvent(
      new CustomEvent("date-filter-changed", { detail: { selectedOption } })
    );
    this.updateTotalExpenses();
  }

  updateTotalExpenses() {
    const selectedOption = this.dateFilterTarget.value;
    this.fechTotalExpenses(selectedOption);
  }

  fechTotalExpenses(dateRange) {}
}
