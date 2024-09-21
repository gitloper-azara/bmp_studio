# Photography Portfolio Website - BMP Studio
This is a photography portfolio website built using Django, designed to display various images owned by BMP Studio.
It stores image metadata in a MySQL database, and actual images are hosted in cloud to reduce database load.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Running the Project](#running-the-project)
- [Directory Structure](#directory-structure)
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
    - `django-imagekit` for image processing
    - `django-widget-tweaks` for form customization
    - `djangorestframework` for web API creation
    - `djangorestframework-simplejwt` for user authentication
    - `ffmpeg` for video processing (can process audio and other multimedia files)

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

4. **Set up environment variables:**
    - Create a `.env` file in the project root and the necessary environment variables
    ```bash
    SECRET_KEY=your_secret_key
    BMP_MYSQL_USER=mysql_username
    BMP_MYSQL_PWD=mysql_password
    BMP_MYSQL_DB=mysql_database_name
    BMP_MYSQL_HOST=localhost
    ```

### Running the Project

1. **Migrate the database:**
    ```bash
    ./manage.py makemigrations
    ./manage.py migrate
    ```

2. **Create a superuser to access the Django Admin:**
    ```bash
    ./manage.py createsuperuser
    ```

3. **Run the development server:**
    ```bash
    ./manage.py runserver
    ```

4. Open the web app at `http://127.0.0.1:8000`.


### Directory Structure

```bash
bmp_studio/
|
|── portfolio/              # main django app
|    |── management/        # custom django management commands
|    |── migrations/        # database migrations
|    |── static/            # static files (CSS, JS, Images)
|    |── templates/         # HTML templates
|    |── admin.py           # django admin config
|    |── apps.py            # app config
|    |── models.py          # models defining database schema
|    |── serializers.py     # complex queryset conversions
|    |── urls.py            # URLs mapping to views
|    └── views.py           # views handling the requests
|
|── imageurlprocessor.py    # processes drive urls to direct urls
|── manage.py               # django management commands
|── requirements.txt        # python dependencies
|── README.md               # project doc
└── .gitignore              # files ignored by git
```
