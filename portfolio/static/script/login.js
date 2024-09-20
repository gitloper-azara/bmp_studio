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
          localStorage.setItem('userId', data.user_id)
          // redirect to the dashboard
          window.location.href = "/dashboard/";
        } else {
          alert(`Invalid credentials. Please try again.`);
        }
      })
      .catch(error => {
        console.error(`Error: ${error}`);
        alert('An internal error occurred. Please try again later.');
      });
    });
  }
});

// script to check if the user is authenticated
function checkAuthentication() {
  const token = localStorage.getItem('accessToken');
  const userId = localStorage.getItem('userId')

  if (!token || !userId) {
    window.location.href = "/user-login";
    return;
  }

  // verify token with the backend
  fetch('/api/verify-token/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    },
    body: JSON.stringify({ user_id: userId })
  })
  .then(response => {
    if (!response.ok) {
      throw new Error('Token verification failed');
    }
    return response.json();
  })
  .then(data => {
    if (!data.is_valid) {
      throw new Error('Token is invalid');
    }
    console.log(`Welcome back, ${data.username}!`);
  })
  .catch(error => {
    console.error('Authentication check failed:', error);
    localStorage.removeItem('accessToken');
    localStorage.removeItem('refreshToken');
    localStorage.removeItem('userId');
    window.location.href = '/user-login';
  });
}

// call when the dashboard page loads
// ONly call checkAuthentication on pages that require authentication to prevent
// the GET /user-login/ loop request
if (window.location.pathname !== '/user-login/') {
  checkAuthentication();
}
