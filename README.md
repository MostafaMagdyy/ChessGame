﻿# Fast-Chess Game

## Overview
This project involves connecting two PCs through a simple network using serial communication. The primary functionalities include chatting and a two-player real-time chess game. The entire project is implemented in assembly language, utilizing the console window for the application with text/graphics mode GUI.

## Connection Mechanism
- Two PCs are connected through the serial port, using Transmit (Tx) and Receive (Rx) signals.
- Each transmitter of one PC is connected to the receiver of the other PC, forming a direct communication link.

## Defining Usernames
- Users are prompted to enter their usernames, limited to 15 characters and starting with a letter.
- Usernames are exchanged between users to facilitate identification during interactions.

## Main Screen
- After entering usernames, the main screen displays available functionalities and navigation instructions.
- Notification bar provides updates, such as received game or chat invitations.
- Users navigate through options like starting a chat (F1), initiating a game (F2), or exiting the program (ESC).

## Chatting
- Users can engage in real-time chat with a split-screen interface.
- A scenario outlines the process: sending chat invitations, accepting invitations, chatting, and returning to the main screen.

## Real-time Chess Game
- Players can play a two-player real-time chess game with a unique twist.
- Game invitations can be sent (F2), accepted, and players enter a game mode with a chessboard, individual timers, and movement controls.
- Detailed scenarios explain piece movement, countdowns, and winning conditions.
- Bonus features include a powerup for reduced countdowns and a batch mode for executing multiple moves.

## Summary
- Users define usernames, start chatting or a game with F1 or F2, and exit with ESC (from the main screen).
- A quit by one user sends an ESC signal to the other user.

## Guidelines
- Messages designed with fixed size for easy handling.
- Organized program structure with procedures and labels.
- Design program as a state machine for effective functionality.
- Consider the C/C++ program structure for clarity.
- Serial communication implementation without reliance on emulators.

