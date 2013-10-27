request = require 'request'
fs = require 'fs'
sax = require 'sax'
saxStream = sax.createStream true
stack = []
pill = {}
src = './pill.xml'

saxStream.on 'opentag', (node)->
	stack.push node.name

saxStream.on 'closetag', (node)->
	stack.pop node.name

saxStream.on 'text', (t)->
	top = stack.length-1
	if stack[top] is 'PRODUCT_CODE'
		pill = {}
		pill.productCode = t
		
	if stack[top] is 'RXSTRING'
		pill.name = t.split(' (')[0]
		
	if stack[top] is 'image_id'
		pill.imageId = t
		imageUrl = "http://pillbox.nlm.nih.gov/assets/small/#{t}.jpg"
		pill.imageUrl = imageUrl
		text = "{'name': '#{pill.name}', \n'productCode': '#{pill.productCode}', \n'imageId': '#{pill.imageId}', \n'imageUrl': '#{pill.imageUrl}'},\n"
		fs.appendFile './pill.json', text, (err)->
			return console.log err if err?


fs.createReadStream(src).pipe(saxStream)
