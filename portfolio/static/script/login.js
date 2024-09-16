const currentUrl = window.location.pathname;
const navItems = document.querySelectorAll('.nav_items a');

navItems.forEach(item => {
  if (item.getAttribute('href') === currentUrl) {
    item.classList.add('active');
  }
});

const menuBtn = document.getElementById('menuBtn');
const navItemsMenu = document.getElementById('navItemsMenu');
const authButtons = document.getElementById('authButtons');
let menuOpen = false;

menuBtn.addEventListener('click', () => {
  if (!menuOpen) {
    menuBtn.classList.add('open');
    navItemsMenu.style.display = 'block';
    menuOpen = true;
    authButtons.classList.toggle('show');
  } else {
    menuBtn.classList.remove('open');
    navItemsMenu.style.display = 'none';
    menuOpen = false;
    authButtons.classList.remove('show');
  }
});

// redirect user to dashboard on successful login or registration
// login first
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
          if (data.access) { // if login data has access key to signify a successful login attempt
            // store access token in localStorage
            localStorage.setItem('accessToken', data.access);
            localStorage.setItem('refreshToken', data.refresh);
            // redirect to the dashboard
            window.location.href = "/dashboard/";
          } else {
            console.error(`Login failed: ${data}`);
          }
        })
        .catch(error => {
          console.error(`Error: ${error}`);
          alert('An error occurred. Please try again later.');
        });
      });
    }
  });
