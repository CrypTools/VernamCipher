/*************************

Use: 'eqnvz'.decrypt("XMCKL")
=> "hello"

*************************/
String.prototype.decrypt = function (key) {
	if (this.length != key.length) {
		throw "Text and Key have to be the same length."
		return 0;
	}
	const alphabet = "abcdefghijklmnopqrstuvwxyz".split("")
	let nText = []
	let kText = []
	for (let i of this) {
		nText.push(alphabet.indexOf(i.toLowerCase()))
	}
	for (let i of key) {
		kText.push(alphabet.indexOf(i.toLowerCase()))
	}
	let out = ""
	for (let i in nText) {
		out += alphabet[(nText[i] - kText[i]) < 0 ? 26 + (nText[i] - kText[i]) : (nText[i] - kText[i]) % 26]
	}
	return out;
}


module.exports = (str, key) => str.decrypt(key);
