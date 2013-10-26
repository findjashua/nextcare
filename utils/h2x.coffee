request = require 'request'
fs = require 'fs'

url = 'http://pillbox.nlm.nih.gov/PHP/pillboxAPIService.php?has_image=1&key=12345'
xml = './pill.xml'
request(url).pipe(fs.createWriteStream(xml))