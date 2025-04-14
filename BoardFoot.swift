// BoardFoot.swift
//
// Created by Santiago Hewett
// Date: 2025/03/20
// Version 1.0
// Copyright (c) Santiago Hewett. All rights reserved.
//
// This program calculates the required length of a board
// based on its width and height to make exactly 1 board foot (144 cubic inches).

import Foundation

// Constant representing 1 board foot in cubic inches
let BOARD_FOOT: Double = 144

func boardFoot() {
    // Display a welcome message and explain what the program does
    print("This program calculates the required length of a piece of wood "
        + "based on its width and height, ensuring the volume is exactly "
        + "1 board foot (144 cubic inches).")

    // Variables to store user input for height and width
    var userHeightDouble: Double = 0
    var userWidthDouble: Double = 0

    // Keep asking for valid input until both width and height are positive numbers
    repeat {
        // Ask the user to enter the height
        print("Please enter the height of the piece of wood (in inches): ")

        // Read the user's input and validate it
        guard let userHeightString = readLine(),
              let userHeightDoubleLoop = Double(userHeightString) else {
            print("Invalid input. Please enter a valid number greater than 0.")
            continue
        }

        // Ask the user to enter the width
        print("Please enter the width of the piece of wood (in inches): ")

        // Read the user's input and validate it
        guard let userWidthString = readLine(),
              let userWidthDoubleLoop = Double(userWidthString) else {
            print("Invalid input. Please enter a valid number greater than 0.")
            continue
        }

        // Assign validated values
        userHeightDouble = userHeightDoubleLoop
        userWidthDouble = userWidthDoubleLoop

        // Ensure both values are greater than 0
        if userHeightDouble <= 0 || userWidthDouble <= 0 {
            print("Invalid input. Height and width must be greater than 0.")
        }
    } while userHeightDouble <= 0 || userWidthDouble <= 0

    // Calculate the required length using the helper function
    let length = calculateBoardFoot(height: userHeightDouble, width: userWidthDouble)

    // Display the calculated length to the user
    print("The required length to make exactly 1 board foot is:", 
          String(format: "%.2f", length), "inches.")
}

// Call the main function
boardFoot()

// Function to calculate the required length to achieve 1 board foot
func calculateBoardFoot(height: Double, width: Double) -> Double {
    return BOARD_FOOT / (height * width)
}
