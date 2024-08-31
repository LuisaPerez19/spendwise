import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dateFilter", "totalExpenses", "startDate", "endDate"];
  connect() {
    console.log("Date filter controller connected");
  }

  updateDateFilter(event) {
    event.preventDefault();
    const selectedOption = this.dateFilterTarget.value;
    if (selectedOption === "") {
      return;
    }
    this.fetchTotalExpenses(`date_range=${selectedOption}`);
  }

  updateCustomRange(event) {
    event.preventDefault();
    const startDate = this.startDateTarget.value;
    const endDate = this.endDateTarget.value;
    if (startDate && endDate) {
      this.fetchTotalExpenses(`start_date=${startDate}&end_date=${endDate}`);
    }
  }

  fetchTotalExpenses(queryString) {
    fetch(`/dashboard?${queryString}`, {
      headers: {
        Accept: "application/json",
        "X-CSRF-Token": document
          .querySelector("meta[name='csrf-token']")
          .getAttribute("content"),
      },
      method: "GET",
    })
      .then((response) => response.json())
      .then((data) => {
        this.totalExpensesTarget.textContent = `£${data.total_expenses.toFixed(
          2
        )}`;
      })
      .catch((error) => console.error("Error:", error));
  }

  refreshTotalExpenses() {
    const queryString = window.location.search;
    this.fetchTotalExpenses(queryString);
  }
}
