/*************************

Use: Number(5).genKey() // generates a key of length 5
=> "xmckl"

*************************/
Number.prototype.genKey = function () {
	const alphabet = "abcdefghijklmnopqrstuvwxyz".split("")
	let out = ""
	for (var i = 0; i < this; i++) {
		out += alphabet[Math.floor(Math.random() * alphabet.length)]
	}
	return out;
};
