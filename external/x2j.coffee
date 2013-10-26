parser = require('xml2json')
fs = require('fs')

fs.readFile('./pill.xml', (err, data)->
	if(err?) return console.log(err)) 
	console.log(data)
	)