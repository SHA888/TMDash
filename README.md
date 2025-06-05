TMDash - # Telemedicine Dashboard

A web-based telemedicine platform built with MoonBit, leveraging WebAssembly (WASM) for high performance and AI-native features for intelligent health data processing. The dashboard enables real-time video/chat communication, health data visualization, appointment management, and AI-driven insights for patients and healthcare providers.

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [API Endpoints](#api-endpoints)
- [Running the Application](#running-the-application)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- **Real-Time Communication**: Video calls and text chat via WebRTC and WebSocket (using JavaScript interop).
- **Health Data Visualization**: Real-time charts for patient vitals (e.g., heart rate, blood pressure) with anomaly detection.
- **Appointment Management**: Schedule, manage, and send reminders for patient appointments.
- **AI-Driven Insights**: Automated patient data summaries and anomaly detection using MoonBit's AI assistant and torch library.
- **Secure Data Handling**: Encrypted data transmission and storage, with type-safe data validation using MoonBit's type system.
- **Cross-Platform**: Runs in browsers via WASM and supports mobile devices through responsive design.

## Tech Stack

- **MoonBit**: Core language for backend and frontend logic, compiled to WASM for performance.
- **WebAssembly (WASM)**: Ensures fast, secure, and lightweight execution in browsers.
- **JavaScript Interop**: Integrates WebRTC (video), Chart.js (visualization), and database access.
- **MoonBit Libraries**: http, http_router for REST APIs, async for non-blocking operations, torch for ML-based anomaly detection.
- **Frontend**: Chart.js for data visualization, with potential React integration via JavaScript interop.
- **Backend**: WASM-compatible serverless platforms (e.g., Cloudflare Workers) or traditional servers.

## Prerequisites

- **MoonBit CLI**: Install the MoonBit compiler and toolchain (see [MoonBit Docs](https://www.moonbitlang.com/docs/)).
- **Node.js**: For JavaScript interop and frontend dependencies (version 16+ recommended).
- **WASM Runtime**: A WASM-compatible environment (e.g., browser or serverless platform).
- **Optional**: Database (e.g., PostgreSQL) for persistent storage, accessed via JavaScript interop.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/SHA888/TMDash.git
   cd TMDash
   ```

2. **Install MoonBit CLI**:
   - Follow instructions at [MoonBit Docs](https://www.moonbitlang.com/docs/).
   - Alternatively, use the cloud IDE at [try.moonbitlang.com](https://try.moonbitlang.com) for no-install setup.

3. **Install Node.js Dependencies**:
   ```bash
   npm install
   ```
   This installs Chart.js, WebRTC libraries, and other JavaScript dependencies.

4. **Set Up Environment Variables**:
   Create a `.env` file in the root directory:
   ```env
   PORT=8080
   DATABASE_URL=your-database-url
   ```

## Usage

1. **Run the Development Server**:
   ```bash
   moon run
   ```
   Starts the MoonBit HTTP server on http://localhost:8080.

2. **Access the Dashboard**:
   Open http://localhost:8080 in a browser to view the dashboard.

3. **Interact with Features**:
   - **Video/Chat**: Start a consultation via the video or chat interface (requires WebRTC setup).
   - **Vitals**: Submit health data via the `/vitals` endpoint and view charts.
   - **Appointments**: Schedule or manage appointments through the dashboard UI.
   - **AI Insights**: View AI-generated summaries or alerts in the doctor's panel.

## Project Structure

```
TMDash/
├── src/
│   ├── main.mbt          # Entry point for the HTTP server
│   ├── models/           # Data models (e.g., PatientData, Vital)
│   │   ├── vitals.mbt
│   │   ├── appointments.mbt
│   ├── routes/           # API route handlers
│   │   ├── vitals.mbt
│   │   ├── appointments.mbt
│   ├── ai/               # AI-driven logic (e.g., anomaly detection)
│   │   ├── anomaly.mbt
│   ├── frontend/         # WASM-based frontend code
│   │   ├── dashboard.mbt
│   ├── docs/             # Markdown-oriented docs (.mbt.md)
│   │   ├── patient-reports.mbt.md
├── public/               # Static assets (HTML, CSS, JS for interop)
├── moon.pkg.json         # MoonBit package configuration
├── package.json          # Node.js dependencies for JavaScript interop
├── README.md             # Project documentation
└── .env                  # Environment variables
```

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/vitals` | POST | Submit patient vitals (e.g., heart rate) |
| `/vitals/:patient_id` | GET | Retrieve vitals history for a patient |
| `/appointments` | POST | Schedule a new appointment |
| `/appointments/:id` | GET | Get appointment details |
| `/chat` | WS | WebSocket for real-time chat |

### Example Request (Vitals):

```bash
curl -X POST http://localhost:8080/vitals \
  -H "Content-Type: application/json" \
  -d '{"patient_id": "123", "vital": {"HeartRate": 85}, "timestamp": "2025-06-05T12:00:00Z"}'
```

### Response:

```json
{
  "status": "Normal",
  "value": 85
}
```

## Running the Application

### Development Mode:
```bash
moon run
```
Compiles and runs the MoonBit server with hot reloading.

### Production Deployment:
1. Compile to WASM:
   ```bash
   moon build --target wasm
   ```
2. Deploy to a WASM-compatible platform (e.g., Cloudflare Workers) or a Node.js server with WASM runtime.
3. Ensure HTTPS for secure data transmission.

### Testing:
```bash
moon test
```
Runs unit tests for API endpoints and AI logic.

## Contributing

We welcome contributions! Follow these steps:

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature/your-feature`.
3. Commit changes: `git commit -m "Add your feature"`.
4. Push to the branch: `git push origin feature/your-feature`.
5. Open a pull request.

Please adhere to the Code of Conduct and include tests for new features.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

- **Project Maintainer**: [Kresna Sucandra](https://github.com/SHA888) on X [@ks_sha888](https://x.com/ks_sha888)

---

Built with [MoonBit](https://moonbitlang.com/) for performance and scalability. Start exploring at [try.moonbitlang.com](https://try.moonbitlang.com/)!
