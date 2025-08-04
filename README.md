# Final Telecom Project – IVR, Monitoring, and Web Application Packaging

This repository contains the deliverables of a final project for the **Telecommunications 3** course at Universidad Autónoma de Occidente. It combines three core components:

- 🗣️ IVR System using FreePBX
- 📊 System Monitoring with Prometheus and Node Exporter
- 🐳 Web App Packaging using Docker and Docker Compose

---

## 📁 Project Structure

```
parcialFinal/
├── ivr/                      # IVR Configuration in FreePBX
├── monitoring/               # Prometheus + Node Exporter setup
│   ├── prometheus.yml
│   └── systemd-service/
├── docker-webapp/           # Dockerized MiniWebApp from class
│   ├── docker-compose.yml
│   └── web/
│       ├── app.py
│       ├── templates/
│       └── requirements.txt
└── README.md
```

---

## 📞 Part 1 – IVR (Interactive Voice Response) with FreePBX

- Set up IVR using [FreePBX Distro](https://downloads.freepbxdistro.org/ISO/SNG7-FPBX-64bit-1904-2.iso)
- Each option in the IVR forwards the call to a specific extension.
- SIP protocol behavior was analyzed in Wireshark covering:
  - Registration
  - Call establishment
  - Call termination
  - Call cancellation before answer

---

## 📈 Part 2 – Prometheus and Node Exporter

- Prometheus installed on a Linux server (Ubuntu 22.04 recommended)
- Node Exporter installed and configured to expose Linux system metrics
- Prometheus configured to scrape metrics every 5 seconds
- Sample config:

```yaml
scrape_configs:
  - job_name: 'node_exporter'
    static_configs:
      - targets: ['localhost:9100']
```

---

## 🌐 Part 3 – Dockerized MiniWebApp

Packaged the [MiniWebApp](https://github.com/omondragon/MiniWebApp) with Docker and Docker Compose:

- Accessible via browser on port 5000 (or mapped to 80)
- Built with Python Flask and Bootstrap

Example `docker-compose.yml`:

```yaml
version: '3'
services:
  web:
    build: ./web
    ports:
      - "80:5000"
```

---

## 📊 Optional Part – Grafana + Prometheus Integration

- Grafana installed on the same Prometheus server
- Data Source added pointing to `http://localhost:9090`
- Dashboard created with real-time metrics visualization

Useful dashboard: [Grafana Dashboard ID 11074](https://grafana.com/grafana/dashboards/11074)

---

## 📌 How to Use

1. Clone the repository:

```bash
git clone https://github.com/pablocardona03/parcialFinal.git
cd parcialFinal
```

2. Follow the instructions inside each folder for setup and testing.

---

## 🎓 Author

**Pablo Cardona** – Final Project for Telecomunicaciones 3

---

## 📄 License

This project is intended for academic and educational use only.
