needle = require 'needle'

baseUrl = 'https://api.carepass.com/good-rx-api/drugprices/low?name='
apiKey = 'p7rhtexgrcgys97e7drmhrr9'

exports.getPrices = (req, res)->
	needle.get "#{baseUrl}#{req.params.name}&apikey=#{apiKey}", (err, resp, body)->
		return res.send err if err?
		return res.send body	

