<a id="readme-top"></a>

<br />
<div align="center">
  <img src="appointment_ui/src/assets/capitec-logo.svg" alt="Logo" width="100" height="100">
  <h3 align="center">Capitec Appointment Booking System</h3>
  <p align="center">
    A system that allows Capitec clients to conveniently book appointments at any branch.
    <br />
  </p>
</div>

<details>
  <H3>Table of Contents</h3>
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
    <li><a href="#contributions">Contributions</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

## About The Project

The **Capitec Appointment Booking System** allows clients and potential clients to book appointments at any Capitec branch.  

Users can:
- Select a branch, date, and time.
- Confirm bookings after authentication (Spring Security demo with auth token).
- View and manage appointments (edit date/time or cancel).
- Cancelled slots reappear for reuse; booked slots disappear to avoid double booking.

This project demonstrates both frontend and backend integration with a focus on user experience.

<p align="right">(<a href="#readme-top">Back to top</a>)</p>

### Built With

#### Frontend
- [Vue.js](https://vuejs.org/)
- [Vite](https://vitejs.dev/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [shadcn/ui](https://ui.shadcn.com/)

#### Backend
- [Java](https://www.oracle.com/java/)
- [Spring Boot](https://spring.io/projects/spring-boot)
- [Flyway](https://flywaydb.org/)
- [PostgreSQL](https://www.postgresql.org/)

#### Tooling & Infrastructure
- [Docker](https://www.docker.com/)
- [Rancher Desktop](https://rancherdesktop.io/)
- [IntelliJ IDEA](https://www.jetbrains.com/idea/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

Follow these steps to set up the project locally.

### Prerequisites
- IDE Terminal or CMD Prompt

- [Node.js & npm](https://nodejs.org/)  

```sh
npm install npm@latest -g
```
- [Docker: Rancher Desktop for docker daemon. Can run in the background.](https://rancherdesktop.io/)

- Optional: Any IDE (VSCode, IntelliJ Ultimate, etc.) - for contributions

### Installation

- Note: There are 2 ways to run this project

- Navigate to a location of your choice and clone the repo:

```sh
git clone https://github.com/AaishahVanWitt_capitec/appointment-booking-system.git
```

- Navigate to the project directory.

- Make start.sh executable and run:

```sh
chmod +x start.sh
./start.sh
```

- Or run via Rancher Desktop:

```sh
docker-compose up --build
```

Access the frontend through Rancher Desktop → Containers → appointment-frontend → port [5173:5173](http://localhost:5173).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

- Select branch, date, and time.
- Confirm booking → login/signup required.
- Authenticated users can view, edit (date/time only), or cancel appointments.
- Booked slots disappear; cancelled slots reappear.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Testing
- Select a branch, date, and time.
- Click Confirm Booking.
- Sign up or log in.
- Successful bookings appears in your appointment list.
- Edit or cancel to test slot availability logic.

Note: Authentication uses Spring Security with token-based demo (no full validation).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Roadmap
- Employee view for branch appointments (schema prepared).
- Branch locator map.
- Contactless appointments (live chat, etc.).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributions

Contributions are welcome!

- Fork the Project
- Create your Feature Branch (git checkout -b feature/AmazingFeature)
- Commit your Changes (git commit -m 'Add some AmazingFeature')
- Push to the Branch (git push origin feature/AmazingFeature)
- Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contact
Aaishah Van Witt: aaishahvanwitt@capitecbank.co.za
Project Link: https://github.com/AaishahVanWitt_capitec/appointment-booking-system

<p align="right">(<a href="#readme-top">back to top</a>)</p>