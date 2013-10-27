mongoose = require 'mongoose'

url = process.env.MONGOLAB_URI || process.env.MONGOHQ_URI || 'mongodb://localhost/nextcare'
db = mongoose.createConnection url

schema = new mongoose.Schema
	name: {type: String}
	productCode: {type: String}
	imageId: {type: String}
	imageUrl: {type: String}

Pill = db.model 'Pill', schema

exports.find = (req, res)->
	condition = {name : req.params.name}
	console.log condition
	Pill.findOne condition, (err, data)->
		console.log data
		return res.send err if err?
		return res.send data.imageUrl if data?

respond = (err, data, res)->
	return res.send err if err?
	return res.send data if data?