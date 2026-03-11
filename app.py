from flask import Flask, render_template
import json
import os


app = Flask(__name__)

# Verweis auf das Wurzelverzeichnis
@app.route("/")
def home():
    return render_template('home.html')


#Adressen

#Adressen aus dem Verzeichnis laden
def load_adressen():
    base_path = os.path.dirname(__file__)
    file_path = os.path.join(base_path, 'adressen.json')

    with open(file_path, 'r', encoding='utf-8') as f:
        return json.load(f)



@app.route("/adressen")
def adressen():
    daten = load_adressen()
    return render_template('adressen.html', adressen=daten)

@app.route("/adressen/<int:adresse_id>")
def adresse_detail(adresse_id):
    return 