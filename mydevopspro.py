from flask import Flask

# Create a Flask application instance
app = Flask(__name__)

# Define the route for the root URL
@app.route("/")
def hello():

	# Return an HTML response
	return "<h1 style='color:blue'>Salut, ça va toi</h1>"

# Run the application if this script is executed directly
if __name__=="__main__":
	
	# Make the app accessible from any host
	app.run(host='0.0.0.0')
