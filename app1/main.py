from flask import Flask
from datetime import date
import json

app = Flask(__name__)

@app.route("/")
def home():
    my_json = {
	"John": "Pepperoni",
	"Mary": "Cheese",
	"Tim": "Mushroom"
    }
    return my_json

@app.route('/file')
def open_file():
    with open('fcc.json', 'r') as fcc_file:
        try:
            fcc_data = json.load(fcc_file)
        except ValueError as err:
            return "Not a Valid JSON FORMAT"
        return fcc_data

if __name__ == "__main__":
    app.run(debug=True)
