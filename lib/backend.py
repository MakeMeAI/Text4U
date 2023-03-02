from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/', methods=['POST'])
def receive_data():
  data = request.get_json()
  name = data['name']
  # Perform some action with the name
  response_data = {'message': f'Hello, {name}!'}
  return jsonify(response_data)

if __name__ == '__main__':
  app.run(host='0.0.0.0', port=5000)