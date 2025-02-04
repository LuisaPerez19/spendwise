import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dateFilter", "startDate", "endDate"];
  connect() {
    console.log("Date filter controller connected");
  }

  updateDateFilter(event) {
    // event.preventDefault();
    const selectedOption = this.dateFilterTarget.value;
    console.log(selectedOption);
    if (selectedOption === "") {
      this.startDateTarget.value = "";
      this.endDateTarget.value = "";
      this.element.querySelector("form").requestSubmit();
      return;
    }

    const selectedOptionElement = this.dateFilterTarget.querySelector(
      `option[value="${selectedOption}"]`
    );

    // Date range from the data-filter attribute
    const dateRangeString = selectedOptionElement.dataset.filter;
    // console.log("Date range string:", dateRangeString);

    const split = dateRangeString.split("|");
    this.startDateTarget.value = split[0];
    this.endDateTarget.value = split[1];

    this.element.querySelector("form").requestSubmit();
  }
}

// updateCustomRange(event) {
//   event.preventDefault();
//   const startDate = this.startDateTarget.value;
//   const endDate = this.endDateTarget.value;
//   console.log(startDate);
//   console.log(endDate);
//   if (startDate && endDate) {

//     // this.fetchTotalExpenses(`start_date=${startDate}&end_date=${endDate}`);
//     // this.updateExpenseList(`start_date=${startDate}&end_date=${endDate}`);
//   }
// }

// fetchTotalExpenses(queryString) {
//   fetch(`/dashboard?${queryString}`, {
//     headers: {
//       Accept: "application/json",
//       "X-CSRF-Token": document
//         .querySelector("meta[name='csrf-token']")
//         .getAttribute("content"),
//     },
//     method: "GET",
//   })
//     .then((response) => response.json())
//     .then((data) => {
//       this.totalExpensesTarget.textContent = `£${data.total_expenses.toFixed(
//         2
//       )}`;
//     })
//     .catch((error) => console.error("Error:", error));
// }

// updateExpenseList(queryString) {
//   fetch(`/dashboard/recent_expenses?${queryString}`, {
//     headers: {
//       Accept: "text/html",
//       "X-CSRF-Token": document
//         .querySelector("meta[name='csrf-token']")
//         .getAttribute("content"),
//     },
//     method: "GET",
//   })
//     .then((response) => response.text())
//     .then((html) => {
//       const recentExpensesSection = document.querySelector(
//         "[data-turbo-frame='recent_expenses']"
//       );
//       recentExpensesSection.innerHTML = html;
//     })
//     .catch((error) => console.error("Error:", error));
// }

// refreshTotalExpenses() {
//   const queryString = window.location.search;
//   this.fetchTotalExpenses(queryString);
// }
