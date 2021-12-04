//
//  BinarySearch.swift
//
//  Created by Ryan Chung
//  Created on 2021-12-03
//  Version 1.0
//  Copyright (c) 2021 Ryan Chung. All rights reserved.
//
//  This program finds a user-inputted number inside of an array using
//  recursion and binary search.
//

import Foundation

let min = 0
let max = 999

// Binary search using recursion
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

// Generates an array populated with 250 random numbers
func generateRandomArray() -> [Int] {
    let arraySize = 250

    var numberArray = (0..<arraySize).map { _ in Int.random(in: min...max) }
    numberArray.sort()

    return numberArray
}

// Reusable error message
func errorMessage() {
    print("ERROR: Invalid Input")
    print("\nDone.")
}

// Creating the random array
let numberArray = generateRandomArray()

// Prints a formatted version of the array
print("\nSorted list of numbers:\n")
for element in numberArray {
    let padded = String(format: "%03d", element)
    print("\(padded), ", terminator: "")
}

// User prompt
print("\n\nWhat number are you searching for in the array"
    + "(integer between 0 and 999): ", terminator: "")

// Gathers and makes sure the user inputted something
guard let searchNumberString = readLine(), !searchNumberString.isEmpty else {
    errorMessage()
    exit(001)
}

// Checks if the inputted string can be parsed to an Int
if let searchNumber = Int(searchNumberString) {

    // Makes sure the user inputted something in between the bounds
    if searchNumber < min || searchNumber > max {
        errorMessage()
        exit(001)
    } else {

        // Gets the index of the number within the array
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
