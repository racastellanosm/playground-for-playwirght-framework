# Playwright Docker Template

This is a simple, lightweight repository demonstrating how to containerize and run end-to-end Playwright tests inside an official Docker container and output an HTML report directly back to your local host machine.

It uses a simple test case against Google to verify browser automation in a headless environment.

## Project Structure

- Dockerfile: Uses the official Microsoft Playwright Ubuntu-based runner image.

- playwright.config.js: Headless test configuration pointing to a local HTML reporter.

- package.json: Contains project metadata and the @playwright/test dependency.

- tests/google.spec.js: Simple test validating browser navigation, cookie banner acceptance, and search query execution.

## Quick Start

Follow these steps to build and run your automated tests inside a Docker container.

### 1. Build the Docker Image

Navigate to the root directory of this project where your Dockerfile is located and run:

```bash
docker build -t playwright-docker-test .
```

### 2. Run Tests & Export the HTML Report

To run your test suite and automatically write the generated Playwright HTML report back to your local machine, run the container using a shared directory volume (-v / --volume).

Choose the command matching your operating system terminal:

On macOS / Linux (Bash or Zsh):

```bash
docker run --rm -v "$(pwd)/playwright-report:/app/reports" playwright-docker-test
```

On Windows (PowerShell):

```bash
docker run --rm -v "${PWD}/playwright-report:/app/reports" playwright-docker-test
```

On Windows (Command Prompt - cmd):

```bash
docker run --rm -v "%cd%/playwright-report:/app/reports" playwright-docker-test
```

### 3. View the HTML Report

Once the test run completes:

Look for a new folder in your local repository root named playwright-report/.

Open the playwright-report/index.html file in any standard web browser to view the interactive test run results, complete with timelines, steps, and diagnostic details.