import os
from flask import Flask
app = Flask(__name__)

@app.route('/') 
def index():
  return 'hello flask!'

if __name__=="__main__":
    # app.run(host="127.0.0.1", port="5000", debug=True)
    app.run(host="0.0.0.0", port=os.environ["PORT"], debug=True)