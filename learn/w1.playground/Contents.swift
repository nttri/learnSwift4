//: Playground - noun: a place where people can play

import UIKit

struct HocSinh{
    var name:String
    var grade:Int
    private mutating func upLevel(){
        self.grade += 1;
    }
}

var hs = HocSinh(name: "bem", grade: 8)

print(hs.grade)
