from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/api', methods = ['GET'])
def returnascii():
    d = {}
    inputchr = str(request.args['query'])
    answer = str(ord(inputchr))
    d['output'] = answer
    return d


'''
@app.route('/')
def hello():
    return 'Hello'


@app.route('/one')
def one():
    return 'one'


@app.route('/two')
def two():
    return 'two'
''' 

if __name__ == "__main__":
    app.run()