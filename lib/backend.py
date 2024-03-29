from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/get_name', methods=['GET', 'POST'])
def receive_data():
    data = request.get_json()
    name = data['name']
    # Perform some action with the name
    #response_data = {'name': f'Hello, {name}!'}
    response_data = {'name': f'{name}!'}
    return jsonify(response_data)


if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=5000)
