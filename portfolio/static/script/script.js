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

document.addEventListener('DOMContentLoaded', () => {
  const grid = document.querySelector('.image-grid');
  const items = grid.querySelectorAll('.img-container');

  const classifyImage = (item) => {
    const aspectRatio = item.dataset.aspectRatio.split('/');
    const width = parseFloat(aspectRatio[0]);
    const height = parseFloat(aspectRatio[1]);

    // if an image is wider than 1.5 times its height, classify it as wide
    // if an image is taller than 1.5 times its width, classify it as tall
    if (width / height >= 1.5) {
      item.classList.add('wide');
    } else if (height / width > 1.5) {
      item.classList.add('tall');
    }
  };


  items.forEach(classifyImage);

  const lazyImageObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const img = entry.target;
        img.src = img.dataset.src;
        img.classList.add('loaded');
        observer.unobserve(img);
      }
    });
  });

  const lazyImages = document.querySelectorAll('img.lazyload');
  lazyImages.forEach(img => lazyImageObserver.observe(img));
});

// show button when user begins scrolling
window.addEventListener('scroll', () => {
  const backToTopBtn = document.getElementById('backToTopBtn');

  if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
    backToTopBtn.style.display = 'block';
  } else {
    backToTopBtn.style.display = 'none';
  }
});

// scroll to the top when user clicks on the button
document.getElementById('backToTopBtn').addEventListener('click', () => {
  window.scrollTo({ top: 0, behavior: 'smooth' });
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
          // redirect to the dashboard
          window.location.href = "{% url 'dashboard' %}";
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
