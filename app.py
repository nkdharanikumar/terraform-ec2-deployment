from flask import Flask, jsonify
import socket
import datetime

app = Flask(__name__)

@app.route("/")
def home():
    hostname = socket.gethostname()
    current_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    return f"""
    <html>
    <head>
        <title>Terraform Deployment</title>
        <style>
            body {{
                background: linear-gradient(135deg, #0f172a, #1e293b);
                color: white;
                font-family: Arial, sans-serif;
                text-align: center;
                padding-top: 80px;
            }}
            .card {{
                background: #1e293b;
                padding: 40px;
                border-radius: 15px;
                display: inline-block;
                box-shadow: 0 0 25px rgba(0,0,0,0.6);
                width: 60%;
            }}
            h1 {{
                color: #38bdf8;
            }}
            p {{
                font-size: 18px;
            }}
        </style>
    </head>
    <body>
        <div class="card">
            <h1>🚀 Terraform + AWS EC2 Deployment</h1>
            <p><b>Instance Hostname:</b> {hostname}</p>
            <p><b>Server Time:</b> {current_time}</p>
            <p>Infrastructure Provisioned using Terraform ☁️</p>
            <p>Application Deployed via Remote Provisioner ⚙️</p>
        </div>
    </body>
    </html>
    """

@app.route("/health")
def health():
    return jsonify({
        "status": "healthy",
        "service": "Terraform Flask App",
        "timestamp": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)