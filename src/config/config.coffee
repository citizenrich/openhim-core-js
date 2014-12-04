nconf = require("nconf")

###
# Define the default constructor
###
Config = ->

	# Define the variables to use
	environment = undefined

	# Get the argument-value to use
	nconf.argv().env "_"
	environment = nconf.get("NODE:ENV") or "development"

	# Load the configuration-values
	# user specified config override
	if nconf.get("path")
		nconf.file 'customConfigOverride', nconf.get('path')

	# development environment override
	if environment is "development"
		nconf.file 'developmentOverride', 'config/' + environment + '.json'

	# load the default config file
	nconf.file 'default', 'config/default.json'
	
	# Return the result
	return

###
# This function return the value that was set in the key-value store
###
Config::get = (key) ->
  nconf.get key

###
# This function constructs a new instanse of this class
###
module.exports = new Config()
