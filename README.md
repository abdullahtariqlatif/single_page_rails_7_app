* Stack Used
  1. Rails 7
  2. SLIM
  3. Hotwire
  4. Stimulus
  5. TurboFrames
  6. Tailwind
  7. MySQL
  8. RSpec
  9. Faker

* The candidate will build a single-page application. On entry, it shows the following buttons:
  1. Personal Data
  2. Employment

* Clicking on Personal Data will cause a Modal to appear, with the following entry fields:
  1. First Name – required, 25 characters limit
  2. Last Name – required, 50 characters limit
  3. Nickname – not required
  4. Email Address - required
  5. Phone Number - required

* The model will have Save & Cancel buttons.

* Email field validation must be done dynamically, as the user enters it.
  1. User cannot proceed to the next field until this is filled and validated.
  2. The error will appear below the field if any.

* Phone number validation must be done dynamically and needs to be in the form
XXX-XXX-XXXX. So, if the user enters 5551115555, as they’re entering it, it will be displayed as 555-111-5555.

* When the form is saved, it automatically goes into the second form: Employment.
* This will also be a modal. It will have the following fields:
  1. Employer - required
  2. Date Started - required
  3. Date Employment Ended - required

* Date fields requirements:
  1. Calendar widget
      As well as
  2. Manual input with field validation
  3. Automatic insertion of separators (MM/DD/YYYY)

* There will be an “Add Employment” button.
  1. When clicked, a new set of employment fields are added.

* The Save button will be grayed out until all the required fields are filled.
