import UIKit

var str = "Hello, playground"

func isPal(str: String) -> Bool {
    let space = [" "]
    let removedSpaces = str.rem
    let loweredString = removedSpaces.lowercased()
    let stringLength = str.count
    var position = 0
    
    while position < stringLength / 2 {
        let startIndex = loweredString.index(loweredString.startIndex, offsetBy: position)
        let endIndex = loweredString.index(loweredString.endIndex, offsetBy: -position - 1)
        
        if loweredString[startIndex] == loweredString[endIndex] {
            position += 1
        } else {
            return false
        }
    }
    
    return true
}




isPal(str: "A man a plan a canal Panama ")
