needle = require 'needle'
request = require 'request'
request.get 'http://localhost:3000/pills', (err, res, body)->
	pill = {}
	pill.name = 'jash'
	request.post 'http://nextcare.herokuapp.com/pills', pill, (err, resp, body)->
		return console.log err if err?
		return console.log body
		