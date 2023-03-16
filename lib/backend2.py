from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello'


@app.route('/one')
def one():
    return 'one'


@app.route('/two')
def two():
    return 'two'


if __name__ == "__main__":
    app.run()