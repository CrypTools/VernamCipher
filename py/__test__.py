import encrypt as e
import decrypt as d
import genKey as g

key = g.genKey(5)

print("Encrypt 'hello' using '" + key + "': " + e.encrypt("hello", key))
print("Decrypting using the same key: " + d.decrypt(e.encrypt("hello", key), key))
