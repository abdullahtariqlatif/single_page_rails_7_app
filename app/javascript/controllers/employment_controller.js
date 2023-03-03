// app/javascript/controllers/employment_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["employerName", "startDate", "endDate", "submitAllBtn", "employmentModal", "modalBodysDiv"]

  connect() {
    // this.loadEmploymentForm();
    // this.startDateTarget.disabled = true
    // this.startDateTarget.classList.add("bg-gray-300")

    // this.endDateTarget.disabled = true
    // this.endDateTarget.classList.add("bg-gray-300")
  }

  validateName(event) {
    const regex = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/
    const element = event.currentTarget;

    if (element.value.length === 0 || element.value === '' || !regex.test(element.value)) {
      // name is invalid
      this.disableSubmitAllBtn();
      this.setErrorForInput(element.nextElementSibling, 'Invalid First Name');

      return false;
    } else {
      // name is valid
      this.removeErrorForInput(element.nextElementSibling);
      this.enableSubmitAllBtn();

      return true;
    }
  }

  // Submit all forms function # 1
  submitAllForms() {
    $('#employmentModal form').each(function(index, element) {
      $.ajax({
        url: $(element).attr('action'),
        method: 'POST',
        data: $(element).serialize(),
        success: function(data) {
          console.log(data);
        },
        error: function(xhr, status, error) {
          console.log(xhr.responseText);
          console.log(status);
          console.log(error);
        }
      });
    });
  }

  addNewEmploymentForm() {
    fetch('/employment_form')
    .then(response => response.text())
    .then(html => {
      this.modalBodysDivTarget.insertAdjacentHTML("beforeend", html);
      this.modalBodysDivTarget.scrollTop = 0;
    })
  }

  disableSubmitAllBtn() {
    this.submitAllBtnTarget.disabled = true;
    this.submitAllBtnTarget.classList.add("bg-gray-300")
  }

  enableSubmitAllBtn() {
    this.submitAllBtnTarget.disabled = false;
    this.submitAllBtnTarget.classList.remove("bg-gray-300")
  }

  setErrorForInput(input, message) {
    input.innerText = message;
    input.classList.add('error-message');
  }

  removeErrorForInput(input) {
    input.innerText = '';
    input.classList.remove('error-message');
  }


  // loadEmploymentForm() {
  //   fetch('/initial_employment_form')
  //   .then(response => response.text())
  //   .then(html => {
  //     this.employmentModalTarget.innerHTML = html;
  //   })
  // }
}
