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

  fetchTotalExpenses(dateRange) {
    fetch(`/dashboard?date_range=${dateRange}`, {
      headers: {
        "X-CSRF-Token": document
          .querySelector("meta[name='csrf-token']")
          .getAttribute("content"),
      },
      method: "GET",
    })
      .then((response) => response.json())
      .then((data) => {
        this.totalExpensesTarget.textContent = data.total_expenses;
      });
  }
}
