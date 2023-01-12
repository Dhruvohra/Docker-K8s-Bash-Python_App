from flask import Flask
from datetime import date
import requests

app = Flask(__name__)

@app.route("/")
def home():
    r = requests.get('http://json-python-svc:5200')
    r=r.json()
    rev_data = dict(reversed(list(r.items())))
    return str(rev_data)
    
if __name__ == "__main__":
    app.run(debug=True)

