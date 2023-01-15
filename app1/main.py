from flask import Flask
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
        except Exception:
            return {"Dummy": "Json Data", "Dudddde":"Zmon"}
        else:
            return dict(fcc_data)

if __name__ == "__main__":
    app.run(debug=True)
