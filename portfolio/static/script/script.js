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

document.querySelectorAll('.img-container img').forEach((img) => {
  img.onload = () => {
    if (img.naturalWidth > img.naturalHeight) {
      img.parentElement.classList.add('landscape');
    } else {
      img.parentElement.classList.add('portrait');
    }
  };
});

document.addEventListener('DOMContentLoaded', () => {
  const grid = document.querySelector('.image-grid');
  const items = grid.querySelectorAll('.img-container');

  const resizeGridItem = (item) => {
    const aspectRatio = item.dataset.aspectRatio.split('/');
    const rowSpan = Math.ceil((aspectRatio[1] / aspectRatio[0]) * (item.clientWidth / 10));
    item.style.gridRowEnd = `span ${rowSpan}`;

    if (aspectRatio[0] / aspectRatio[1] > 1.5) item.classList.add('wide');
    if (aspectRatio[1] / aspectRatio[0] > 1.5) item.classList.add('tall');
    if (aspectRatio[0] / aspectRatio[1] > 1.5 && aspectRatio[1] / aspectRatio[0] > 1.5) item.classList.add('big');
  };

  const resizeAllGridItems = () => {
    items.forEach(resizeGridItem);
  };

  resizeAllGridItems();
  window.addEventListener('resize', resizeAllGridItems);

  const lazyImages = document.querySelectorAll('img.lazyload');
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

  lazyImages.forEach(img => lazyImageObserver.observe(img));
});
