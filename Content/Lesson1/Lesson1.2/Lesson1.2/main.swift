//
//  main.swift
//  Lesson1.2
//
//  Created by Batuhan Arda on 22.08.2025.
//

import Foundation

func calculate(sayi1 a: Double, sayi2 b: Double, operation: String) -> Double? {
    switch operation {
    case "topla":
        return a + b
    case "çıkar":
        return a - b
    case "çarp":
        return a * b
    case "böl":
        return b != 0 ? a / b : nil
    default:
        return nil
    }
}

if let result = calculate(sayi1:10,sayi2:2, operation: "böl") {
    print("Sonuç: \(result)")
} else {
    print("Geçersiz işlem")
}



let numbers = [3, 12, 7, 20, 5, 15, 1]

let filtered = numbers.filter { $0 > 10 }
let sorted = filtered.sorted { $0 > $1 }

print("Orijinal dizi: \(numbers)")
print("10'dan büyük olanlar: \(filtered)")
print("Azalan sırayla: \(sorted)")


let names = ["Zeynep", "Ahmet", "Mehmet", "Ayşe"]

let filteredNames = names.filter { $0.hasPrefix("A") }
let sortedNames = filteredNames.sorted()

print("A ile başlayanlar: \(filteredNames)")
print("Sıralı: \(sortedNames)")
