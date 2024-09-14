const currentUrl = window.location.pathname;
const navItems = document.querySelectorAll('.nav_items a');

navItems.forEach(item => {
  if (item.getAttribute('href') === currentUrl) {
    item.classList.add('active');
  }
});

const menuBtn = document.getElementById('menuBtn');
const navItemsMenu = document.getElementById('navItemsMenu');
let menuOpen = false;

menuBtn.addEventListener('click', () => {
  if (!menuOpen) {
    menuBtn.classList.add('open');
    navItemsMenu.style.display = 'block';
    menuOpen = true;
  } else {
    menuBtn.classList.remove('open');
    navItemsMenu.style.display = 'none';
    menuOpen = false;
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
