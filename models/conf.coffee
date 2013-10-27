email = require '../utils/email'

exports.invite = (req, res)->
	url = req.body.url
	message = 
		from: 'hackdemouser@gmail.com'
		subject: "you've been invited to a video conf"
		text: "click here to join #{url}"
	#for address in req.body.addresses
	message.to = req.body.addresses
	#console.log message
	email.send message, (err, data)->
		respond err, data, res

respond = (err, data, res)->
	return res.send err if err?
	return res.send 'your invites were sent'


