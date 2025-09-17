//
//  main.swift
//  Lesson1.1
//
//  Created by Batuhan Arda on 22.08.2025.
//

import Foundation

var fullName: String = "Batuhan Arda"
var age: Int = 24
var isDeveloper: Bool = true
var height: Double = 1.80

let computer: String? = "Macbook"
if let computer = computer {
    print("Instagram: \(computer)")
} else {
    print("Instagram hesabı yok.")
}

var age1: Int? = 24
print("Yaş: \(age1!)")

var city: String? = nil
let finalCity = city ?? "Bilinmiyor"
print("Şehir: \(finalCity)")


var age2: String = "Batu"
func greet(_ name: String?) {
    guard let unwrappedName = name else {
        print("İsim yok")
        return
    }
    print("Merhaba, \(unwrappedName)!")
}
greet(city)
greet(age2)
