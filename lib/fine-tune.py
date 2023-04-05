import os
import requests
from flask import Flask, request

import openai


url = "http://localhost:5000/generate_text"
prompt = "hello,"


app = Flask(__name__)
openai.api_key = os.environ["OPENAI_API_KEY"]


# API endpoint
@app.route("/generate_text")
def generate_text():
    prompt = request.args.get("prompt")
    #the gpt3 model that is used
    model = "text-davinci-002"
    response = openai.Completion.create (
        engine = model,
        prompt = prompt,
        max_tokens = 1024,
        n = 1,
        stop = None,
        temperature = 0.5,
    )
    return response.choices[0].text

if __name__ == "__main__":
    app.run()

url = "http://localhost:5000/generate_text"
prompt = "Hello, World!"
response = requests.get(url, params={"prompt": prompt})
output = response.text
print(output)