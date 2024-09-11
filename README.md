# Photography Portfolio Website - BMP Studio
This is a photography portfolio website built using Django, designed to display various images owned by BMP Studio.
It stores image metadata in a MySQL database, and actual images are hosted in cloud to reduce database load.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Getting Started]()
- [Installation]()
- [Running the Project]()
- [Environment Variables]()
- [Database Setup]()
- [Directory Structure]()
- [License]()

## Features

- Displays images in various categories.
- Filters images based on categories.
- User registration, authentication and a dashboard.
- Ability to manage images by user.
- Secure storage of image metadata using MySQL.
- Responsive design for mobile and desktop.

## Technologies Used

- **Backend:** Django (Python), MySQL
- **Frontend:** HTML, CSS, JavaScript
- **Database:** MySQL
- **Authentication:** Django Authentication
- **Other Libraries:**
    - `python-decouple` for env management
    - `pillow` for image processing
    - `django-staticfiles` for static asset management

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- Python 3.x
- MySQL
- Pip (Python package installer)
- Django
- Virtualenv (optional but recommended)

### Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/gitloper-azara/bmp_studio.git
    cd bmp_studio
    ```

2. **Create a virtual environment:**
    ```bash
    python3 -m venv venv
    source venv/bin/activate  # on windows user `venv\Scripts\activate`
    ```

3. **Install the dependencies:**
    ```bash
    pip install -r requirements.txt
    ```
