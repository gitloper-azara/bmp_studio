document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector('.auth-form');
  if (form) {
    form.addEventListener('submit', (event) => {
      event.preventDefault();
      const formData = new FormData(form);

      fetch(form.action, {
        method: 'POST',
        body: formData,
        headers: {
          'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value
        }
      })
      .then(response => response.json())
      .then(data => {
        console.log(data);
        if (data.access) { // if register data has access key to signify a successful registration
          // store access and refresh token in localStorage
          localStorage.setItem('accessToken', data.access);
          localStorage.setItem('refreshToken', data.refresh);
          // redirect to the dashboard
          window.location.href = "/dashboard/";
        } else {
          // display validation errors
          const errorDivs = document.querySelectorAll('.error');
          errorDivs.forEach(div => div.remove()); // clear previous errors

          const errors = data;
          for (const field in errors) {
            const fieldErrors = errors[field];
            console.log(fieldErrors);
            const errorDiv = document.createElement('div');
            errorDiv.className = 'error';

            // display the error message for each field
            errorDiv.textContent = fieldErrors.join(', ');
            document.querySelector(`#id_${field}`).parentElement.appendChild(errorDiv);
          }
        }
      })
      .catch(error => {
        console.error(`Error: ${error}`);
        alert('An internal error occurred. Please try again later.');
      });
    });
  }
});
