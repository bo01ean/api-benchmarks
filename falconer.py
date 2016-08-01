# things.py

# Let's get this party started!
import falcon

def fib(n):
	n = int(n)
	if n == 0:
		return 0
	elif n == 1:
		return 1
	else:
		return fib(n - 1) + fib(n - 2)
# Falcon follows the REST architectural style, meaning (among
# other things) that you think in terms of resources and state
# transitions, which map to HTTP verbs.
class FibResource(object):
    def on_get(self, req, resp, number):
        resp.status = falcon.HTTP_200  # This is the default status
        resp.body = '{0}'.format(fib(number))

# falcon.API instances are callable WSGI apps
app = falcon.API()

# Resources are represented by long-lived class instances
fibs = FibResource()

# things will handle all requests to the '/things' URL path
app.add_route('/fib/{number}', fibs)