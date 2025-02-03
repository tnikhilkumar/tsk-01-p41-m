from flask import Flask, jsonify, request
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def get_time_and_ip():
    timestamp = datetime.utcnow().isoformat() + 'Z'
    client_ip = request.remote_addr
    return jsonify({
        'timestamp': timestamp,
        'ip': client_ip
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)