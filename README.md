# MyDevOpsPro Project

---

## Description

This project demonstrates a simple Flask application deployed using Docker. The application displays a message at the root URL and is tested and deployed as part of the DevOps2 environment.

### Key Features
- A minimal Flask application (`mydevopspro.py`).
- Pre-deployment tests using DevOps2 setup.
- Dockerized environment for seamless deployment.

---

## Prerequisites

Before running the project, ensure you have the following installed:
- **Git**
- **Docker**
- **Docker Compose**

It is recommended to first clone and configure the [DevOps2 project](https://github.com/Anjalo18/DevOps2).

---

## Installation and Deployment

### Step 1: Clone the Repository

Start by cloning the repository to your local machine:

```bash
git clone https://github.com/Anjalo18/DevOps2.git
cd DevOps2
```

---

### Step 2: Run Pre-Deployment Tests

Run the pre-deployment tests provided in the `DevOps2` project:

```bash
sudo docker compose build
sudo docker compose up
```

Ensure the tests pass before proceeding.

---

### Step 3: Access the Application

Once the container is running, open your browser and visit:
- [http://localhost:5000](http://localhost:5000)
- [http://127.0.0.1:5000](http://127.0.0.1:5000)

You should see a message displayed in blue: "Salut, ça va toi."

---

### Step 4: Stop and Remove Containers

To clean up resources, run:

```bash
sudo docker compose down
```

---

## Project Structure

### `mydevopspro.py`

This is the core of the project. It contains:
- A Flask application.
- A root route (`/`) that returns an HTML response with a friendly greeting.

---

## Useful Commands

- **Run tests and build the image**: `sudo docker compose build`
- **Start the application**: `sudo docker compose up`
- **Access the application**:
  - [http://localhost:5000](http://localhost:5000)
  - [http://127.0.0.1:5000](http://127.0.0.1:5000)
- **Stop and clean up**: `sudo docker compose down`

---
