// Test made using EyeJS - https://eye.js.org

const path = require('path').normalize(__testDir + "/../")

const encrypt = require(path + "encrypt.js")
const decrypt = require(path + "decrypt.js")
const genKey = require(path + "generateKey.js")

const randomKey = Number(5).genKey()

console.log(`Using key of length 5: ${randomKey}`)

eye.test("Encryption", "node",
	$ => $(encrypt("hello", randomKey)).length(5),
	$ => $(encrypt("hello", "XMCKL")).Equal("eqnvz")
)
eye.test("Decryption", "node",
	$ => $(decrypt("eqnvz", "XMCKL")).Equal("hello"),
	$ => $(decrypt(encrypt("hello", randomKey), randomKey)).Equal("hello")
)
