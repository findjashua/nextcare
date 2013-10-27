mongoose = require 'mongoose'

url = process.env.MONGOLAB_URI || process.env.MONGOHQ_URI || 'mongodb://localhost/nextcare'
db = mongoose.createConnection url

schema = new mongoose.Schema
	name: {type: String}
	productCode: {type: String}
	imageId: {type: String}
	imageUrl: {type: String}

Pill = db.model 'Pill', schema

respond = (err, data, res)->
	return res.send err if err?
	return res.send data if data?

exports.list = (req, res)->
	Pill.find (err, data)->
		respond err, data, res

exports.findByProductCode = (req, res)->
	condition = {productCode : req.params.productCode}
	Pill.findOne condition, (err, data)->
		respond err, data, res

exports.findByName = (req, res)->
	condition = {name: req.params.name}
	Pill.findOne condition, (err, data)->
		respond err, data, res

exports.create = (req, res)->
	pill = new Pill req.body
	pill.save (err, data)->
		respond err, data, res


