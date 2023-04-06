import os
import requests
from flask import Flask, request

import openai


url = "http://localhost:5000/generate_text"
prompt = "hello,"


app = Flask(__name__)
openai.api_key = os.environ["OPENAI_API_KEY"]


# API endpoint testing
#@app.route("/generate_text")

# calls method for post
@app.route("/generate_text", methods=["POST"])
def generate_text():
    #checking that the model is connected - comment when the model is ready to be used
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

    # uncomment this when the model is trained and saved to the folder.
    #model_path = os.path.join("models", "fine_tuned_model.bin")
    #model = load_model(model_path)

    #prompt = request.json.get("prompt")

    #generate_text  = model.generate(prompt)

    #return {"generated_text": generated_text}


if __name__ == "__main__":
    app.run()

# part of testing... not needed for final model
url = "http://localhost:5000/generate_text"
prompt = "Hello, World!"
response = requests.get(url, params={"prompt": prompt})
output = response.text
print(output)