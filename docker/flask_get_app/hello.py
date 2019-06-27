from flask import Flask, jsonify, abort, make_response

fapi = Flask(__name__)

@fapi.route('/hello', methods=['GET'])
def get():
    res = { "message": "hello world" }
    return make_response(jsonify(res))

if __name__ == '__main__':
    fapi.run(host='0.0.0.0', port=3000)
