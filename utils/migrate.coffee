needle = require 'needle'

needle.get 'http://localhost:3000/pills', (err, res, body)->
	return console.log err if err?
	for pill in body
		delete pill.id
		needle.post 'http://nextcare.herokuapp.com/pills', pill, (err, resp, body)->
			return console.log err if err?
			return console.log body
		