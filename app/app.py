from flask import Flask, request
from auth import Auth0


app = Flask(__name__)
@app.route('/get_token', methods=['POST'])
def get_token():
    json_data = request.get_json()
    email = json_data.get('email')
    password = json_data.get('password')
    proxy = json_data.get('proxy')
    if email is None:
        return 'You should provide email'
    if password is None:
        return 'You should provide password'
    data = Auth0(email, password, proxy=proxy)
    token = data.auth(login_local=True)
    return {"access_token": token}


if __name__ == '__main__':
    app.run(debug=True)