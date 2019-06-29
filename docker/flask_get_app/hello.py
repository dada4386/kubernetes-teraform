#!/usr/bin/env python3
from flask import Flask, jsonify, abort, make_response

fapi = Flask(__name__)

@fapi.route('/hello', methods=['GET'])
def hello():
    res = { "message": "hello world" }
    return make_response(jsonify(res))

@fapi.route('/healthcheck', methods=['GET'])
def healthcheck():
    res = { "status": "ok" }
    return make_response(jsonify(res))

if __name__ == '__main__':
    fapi.run(host='0.0.0.0', port=3000, threaded=True)
