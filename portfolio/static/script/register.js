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
        if (data.access) { // if register data has access key to signify a successful registration
          // store access and refresh token in localStorage
          localStorage.setItem('accessToken', data.access);
          localStorage.setItem('refreshToken', data.refresh);
          // redirect to the dashboard
          window.location.href = data.redirect_url;
        } else {
          // display validation errors
          const errorDivs = document.querySelectorAll('.error');
          errorDivs.forEach(div => div.remove()); // clear previous errors

          const errors = data.errors;
          for (const field in errors) {
            const errorMsg = errors[field];
            console.log(errorMsg);
            const errorDiv = document.createElement('div');
            errorDiv.className = 'error';
            errorDiv.textContent = errorMsg.join(', ');
            document.querySelector(`#id_${field}`).parentElement.appendChild(errorDiv);
          }
        }
      })
      .catch(error => {
        console.error(`Error: ${error}`);
        alert('An error occurred. Please try again later.');
      });
    });
  }
});
