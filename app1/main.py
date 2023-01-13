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

if __name__ == "__main__":
    app.run(debug=True)

# @app.route('/file')
# def open_file():
#     with open('fcc.json', 'r') as fcc_file:
#         fcc_data = json.load(fcc_file)
#         #print(fcc_data)
#         return str(fcc_data)
