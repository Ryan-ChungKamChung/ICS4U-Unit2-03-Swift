//
//  Factorial.swift
//
//  Created by Ryan Chung
//  Created on 2021-12-01
//  Version 1.0
//  Copyright (c) 2021 Ryan Chung. All rights reserved.
//
//  This program calculates the factorial of a user-inputted integer.
//

import Foundation

let min = 0
let max = 999

func binarySearch(numberArray: [Int], userNumber: Int,
                  lowIndex: Int, highIndex: Int) -> Int {

    var returnValue: Int

    if highIndex >= lowIndex {

        let mid = (highIndex + lowIndex) / 2

        if numberArray[mid] == userNumber {
            returnValue = mid
        } else if numberArray[mid] > userNumber {
            returnValue =
                binarySearch(
                    numberArray: numberArray, userNumber: userNumber,
                    lowIndex: lowIndex, highIndex: mid - 1)
        } else {
            returnValue =
                binarySearch(
                    numberArray: numberArray, userNumber: userNumber,
                    lowIndex: mid + 1, highIndex: highIndex)
        }

    } else {
        returnValue = -1
    }

    return returnValue
}

func generateRandomArray() -> [Int] {
    let arraySize = 250

  var numberArray = (0..<arraySize).map { _ in Int.random(in: min...max) }
    numberArray.sort()

    return numberArray
}

func errorMessage() {
    print("ERROR: Invalid Input")
    print("\nDone.")
}

let numberArray = generateRandomArray()

print("\n Sorted list of numbers:\n")
for element in numberArray {
    let padded = String(format: "%03d", element)
    print("\(padded), ", terminator: "")
}

print("\n\nWhat number are you searching for in the array"
    + "(integer between 0 and 999): ", terminator: "")

guard let searchNumberString = readLine(), !searchNumberString.isEmpty else {
    errorMessage()
    exit(001)
}

if let searchNumber = Int(searchNumberString) {
    if searchNumber < min || searchNumber > max {
        errorMessage()
        exit(001)
    } else {
        let searchResult = binarySearch(
            numberArray: numberArray, userNumber: searchNumber,
            lowIndex: 0, highIndex: numberArray.count - 1)

        if searchResult == -1 {
            print("The number isn't in the array!")
        } else {
            print("Your number is in index \(searchResult)")
        }
    }
} else {
    errorMessage()
    exit(001)
}

print("\nDone.")
