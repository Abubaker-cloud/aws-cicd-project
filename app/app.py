
import os
from flask import Flask, jsonify

app = Flask(__name__)

APP_VERSION = os.getenv("APP_VERSION", "1.0.0")
ENVIRONMENT = os.getenv("ENVIRONMENT", "development")

@app.route("/")
def home():
    return jsonify({
        "message": "AWS CI/CD Pipeline is running!",
        "application": "DevOps Flask Application",
        "version": APP_VERSION,
        "environment": ENVIRONMENT
    })

@app.route("/health")
def health():
    return jsonify({
        "status": "healthy"
    }), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
