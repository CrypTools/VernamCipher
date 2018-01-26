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
        func getRandomNum(_ min: Int, _ max: Int) -> Int {
            #if os(Linux)
                return Int(random() % max) + min
            #else
                return Int(arc4random_uniform(UInt32(max)) + UInt32(min))
            #endif
        }
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        var out = "";
        for i in 1...self {
            out += String(alphabet[getRandomNum(0, 25)])
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
