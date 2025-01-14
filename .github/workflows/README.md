# CI/CD Workflow for DevOps Project

---

## Overview

This GitHub Actions workflow automates the CI/CD process for a Flask application, including:
- Running tests to verify the Python environment.
- Building, running, and verifying a Docker container.
- Merging changes from the `dev` branch to the `staging` branch.

---

## Workflow Triggers

The workflow is triggered automatically when changes are pushed to the `dev` branch.

---

## Workflow Steps

### 1. **Run Python Tests**

This job ensures that the Python environment is properly set up and performs basic tests to verify functionality.

#### Steps:
1. Checkout the code using `actions/checkout@v3`.
2. Set up Python using `actions/setup-python@v4`.
3. Install Flask using `pip install flask`.
4. Verify the Python version.
5. Run a basic Python test script.
6. Output a success message upon passing tests.

### 2. **Build and Deploy Docker Container**

This job builds, runs, and validates the Docker container for the application after successful tests.

#### Steps:
1. Checkout the code using `actions/checkout@v3`.
2. Set up Docker with `docker/setup-buildx-action@v2`.
3. Pull the Docker image from `anjalo18/docker_image_devops:lastest`.
4. Run the Docker container, exposing port `5000`.
5. Ensure a log file exists for testing.
6. Capture Docker container logs and save them to `log_message.txt`.
7. Check the logs for a `SUCCESS` message and validate the container.
8. Merge changes from `dev` to `staging` using a GitHub Actions bot.
9. Clean up resources by stopping and removing the Docker container.

---

## Prerequisites

- **GitHub Repository**:
  Ensure your repository contains the required `work_compose.yml` file in the `.github/workflows/` directory.

- **Secrets**:
  Add the following GitHub secrets to your repository:
  - `GITHUB_TOKEN`: For authenticating the GitHub Actions bot.

---

## Workflow Structure

### `work_compose.yml`

- **Test Job**:
  - Verifies Python setup.
  - Runs basic tests to confirm environment integrity.

- **Build-and-Deploy Job**:
  - Pulls and runs a Docker image.
  - Validates container functionality by checking logs.
  - Merges changes to `staging` upon success.

---

## Usage

1. **Trigger the Workflow**:
   Push changes to the `dev` branch to start the CI/CD process.

2. **Monitor Workflow Progress**:
   Navigate to the GitHub Actions tab in your repository to view progress and logs.

3. **Review Deployment**:
   Upon successful completion, review the merged changes in the `staging` branch.

---

## Useful Links

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Docker Documentation](https://docs.docker.com/)
