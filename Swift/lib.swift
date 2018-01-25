/*********************************
 *
 * Use: 5.genKey
 * => "xmckl"
 * Use: "hello".encrypt("XMCKL")
 * => "eqnvz"
 * Use: 'eqnvz'.decrypt("XMCKL")
 * => "hello"
 *
 *********************************/
import Foundation

extension Int {
    var genKey : String {
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        var out = "";
        for i in 1...self {
            out += String(alphabet[Int(arc4random_uniform(26))])
        }
        return out;
    }
}
extension String {
    func encrypt (_ key: String) -> String {
        if self.count != key.count {
            return "Text and Key have to be the same length."
        }
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        var nText = Array(self.lowercased())
        var kText = Array(key.lowercased())
        var out = "";
        for i in 0...nText.count - 1 {
            out += String(alphabet[(alphabet.index(of: nText[i])! + alphabet.index(of: kText[i])!) % 26])
        }
        return out;
    }
    func decrypt (_ key: String) -> String {
        if self.count != key.count {
            return "Text and Key have to be the same length."
        }
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        var nText = Array(self.lowercased())
        var kText = Array(key.lowercased())
        var out = "";
        for i in 0...nText.count - 1 {
            let op = (alphabet.index(of: nText[i])! - alphabet.index(of: kText[i])!)
            out += String(alphabet[op < 0 ? 26 + op : op % 26])
        }
        return out;
    }
}
