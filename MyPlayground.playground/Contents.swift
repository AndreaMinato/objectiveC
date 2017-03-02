//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//*******************************INIZIO CLASSE********************************

public class MyPhuckingFirstClass{
    var my : String
    private var phucking : String
    private var firstClass : String
    
    var displayName : String{
        get{
            return my + " " + phucking + " " + firstClass
        }
    }
    
    func simpleDescritpion() -> String {
        return my + " " + phucking + " " + firstClass
    }
    
    public init(my : String, phucking : String, firstClass : String){
        self.my = my
        self.phucking = phucking
        self.firstClass = firstClass
    }
    
    
}
let yolo = MyPhuckingFirstClass.init(my: "my", phucking: "phucking", firstClass: "class")
var lol = yolo

yolo.my = "second"
print(lol.displayName)
print(lol.simpleDescritpion())

//*******************************FINE CLASSE********************************
//*******************************INIZIO VARIABILI E STRINGHE****************

let label = "Questa è una label"
let larghezza = 90
let margin = 10
let padding = 20.0
let larghezzaLabel = label + String(larghezza) //sconsigliato
let stringa = "La label è larga \(padding) cm" //si fa così

//*******************************INIZIO ARRAY*******************************

var myArray = ["A", "B", "C", "D"]
var anotherArray = [String]()
anotherArray.insert("0", at: anotherArray.count)
anotherArray.append("1")
anotherArray.popLast()
anotherArray.append("2")
var andAnotherOne = [Int](repeating:0, count:1)

for obj in andAnotherOne{
    print("shish")
}

for i in 0...99{
    andAnotherOne.append(i)
    if(i%2==0){
        print(i)
    }
}

andAnotherOne.reduce(0){(result: Int, next : Int)->Int in return result+next}

andAnotherOne.map{(Element:Int)->Int in
            print(Element)
    return Element+1
}

//*******************************FINE ARRAY*********************************
//*******************************INIZIO SWITCH******************************

let shish = "yolo"

switch shish {
case "shish":
        print("shishh")
case "swag", "yolo":
        print("uot ev ai don uit mai laif")
default:
    print("mai inglish is no gud")
}

//*******************************FINE SWITCH*********************************
//*******************************INIZIO STRANE*******************************

let interestingNumbers = [
    "Prime" : [2,3,5,7,11,13],
    "Fibonacci" : [1,1,2,3,5,8],
    "Square" : [1,2,9,16,25]
]
var max = 0

for (kind,numbers) in interestingNumbers{
    print(kind)
    for number in numbers {
        if number > max{
            max=number
            print(max)
        }
    }
    
}





