email = require 'emailjs'
server = email.server.connect
	user: 'hackdemouser'
	password: 'test=1234'
	host: 'smtp.gmail.com'
	ssl: true

exports.send = (message, callback)->
	server.send message, (err, data)->
		callback err, data
	
