import { Application } from "@hotwired/stimulus";
import DateFilterController from "../controllers/date_filter_controller.js";

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

Stimulus.register("date-filter", DateFilterController);

export { application };
