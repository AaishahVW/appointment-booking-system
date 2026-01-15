<a id="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Unlicense License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <img src="images/logo.png" alt="Logo" width="80" height="80">
  <h3 align="center">Capitec Appointment Booking System</h3>
  <p align="center">
    A system that allows Capitec clients to conveniently book appointments at any branch.
    <br />
    <a href="#about-the-project"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="#usage">View Demo</a>
    ·
    <a href="#roadmap">Roadmap</a>
    ·
    <a href="#contributing">Contribute</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#testing">Testing</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

The **Capitec Appointment Booking System** allows clients and potential clients to book appointments at any Capitec branch.  
Users can:
- Select a branch, date, and time.
- Confirm bookings after authentication (Spring Security demo with auth token).
- View and manage appointments (edit date/time or cancel).
- Cancelled slots reappear for reuse; booked slots disappear to avoid double booking.

This project demonstrates both frontend and backend integration with a focus on user experience.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With
* [![Vue][Vue.js]][Vue-url]
* [![Vite](https://img.shields.io/badge/Vite-646CFF?style=for-the-badge&logo=vite&logoColor=white)](https://vitejs.dev/)
* [VSCode](https://code.visualstudio.com/)
* [Shadcn](https://ui.shadcn.com/)
* [IntelliJ IDEA](https://www.jetbrains.com/idea/)
* [Spring Boot](https://spring.io/projects/spring-boot)
* [Flyway](https://flywaydb.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Docker](https://www.docker.com/)
* [Rancher Desktop](https://rancherdesktop.io/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

Follow these steps to set up the project locally.

### Prerequisites
- [Node.js & npm](https://nodejs.org/)  
  ```sh
  npm install npm@latest -g

Docker or Rancher Desktop running in the background.

Any IDE terminal (VSCode, IntelliJ, etc.).

## Installation

Clone the repo:

```sh
git clone https://github.com/github_username/repo_name.git

Navigate to the project directory.

Make start.sh executable and run:

sh
chmod +x start.sh
./start.sh
Or run:

sh
docker-compose up --build
Access the frontend via the URL provided in your terminal or through Rancher Desktop → Containers → frontend service.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

Usage
Select branch, date, and time.

Confirm booking → login/signup required.

Authenticated users can view, edit (date/time only), or cancel appointments.

Booked slots disappear; cancelled slots reappear.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

Testing
Select a branch, date, and time.

Click Confirm Booking.

Sign up or log in.

Verify booking appears in your appointment list.

Edit or cancel to test slot availability logic.

Note: Authentication uses Spring Security with token-based demo (no full validation).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

Roadmap
[ ] Employee view for branch appointments (schema prepared).

[ ] Branch locator map.

[ ] Contactless appointments (live chat, etc.).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

Contributing
Contributions are welcome!

Fork the Project

Create your Feature Branch (git checkout -b feature/AmazingFeature)

Commit your Changes (git commit -m 'Add some AmazingFeature')

Push to the Branch (git push origin feature/AmazingFeature)

Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

License
Distributed under the Unlicense License. See LICENSE.txt for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

Contact
Aaishah Van Witt - aaishahvanwitt@capitecbank.co.za
Project Link: https://github.com/github_username/repo_name

<p align="right">(<a href="#readme-top">back to top</a>)</p>

Acknowledgments
Choose an Open Source License

GitHub Emoji Cheat Sheet (webpagefx.com in Bing)

Malven's Flexbox Cheatsheet

Malven's Grid Cheatsheet

Img Shields

GitHub Pages

Font Awesome

React Icons (react-icons.github.io in Bing)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com
