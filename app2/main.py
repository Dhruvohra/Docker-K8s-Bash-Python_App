from flask import Flask
from datetime import date
import json

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello, World!, this is app 2"
    
@app.route('/rev')
def open_file():
    with open('/app/fcc.json', 'r') as fcc_file:
        fcc_data = json.load(fcc_file)
        rev_data = dict(reversed(list(fcc_data.items())))
        return str(rev_data)

if __name__ == "__main__":
    app.run(debug=True)