email = require '../utils/email'

exports.invite = (req, res)->
	url = req.body.url
	message = 
		from: 'hackdemouser@gmail.com'
		subject: "you've been invited to a video conf"
		text: "click here to join #{url}"
	addresses = req.body.addresses.split(',')
	for address in addresses
		console.log address
		message.to = req.body.addresses
		email.send message, (err, data)->
			respond err, data, res

respond = (err, data, res)->
	return res.send err if err?
	return res.send 'your invites were sent'


