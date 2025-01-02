# Quantum Tic-Tac-Toe Project  

## Overview  

The **Quantum Tic-Tac-Toe** project is a two-player quantum game implemented using **Qiskit**. The game blends the classic structure of Tic-Tac-Toe with quantum mechanics, introducing players to quantum gates, superposition, and entanglement. Players compete to transform a **3-qubit quantum circuit** into their respective target states:  
- **Player 0:** Target state |000⟩  
- **Player 1:** Target state |111⟩  

The game ends when both players agree to stop, one player runs out of gate points, or termination requests are exhausted.  

## Project Structure  

- **`qttt.ipynb`**: Contains the Jupyter Notebook for the implementation, including game logic, quantum circuit operations, and result analysis.  

### Key Features  

1. **Quantum Gate Application:**  
   - Players apply quantum gates strategically while managing gate costs.  
   - **Gate Costs:**  
     - **Single-Qubit Gates (Cost 1):** `H`, `X`, `I`, `SX`, `T`, `Tdg`  
     - **Two-Qubit Gates (Cost 2):** `CX`, `SWAP`  
     - **Three-Qubit Gates (Cost 3):** `CCX`, `CSWAP`  

2. **Scoring System:**  
   - Points are awarded based on the probability of measuring the target states.  

3. **Turn-Based Gameplay:**  
   - Players alternate turns, selecting gates and qubits, with in-game prompts ensuring valid moves.  

4. **Session Management:**  
   - Utilizes **Qiskit AerSimulator** for simulation and result analysis.  

5. **Ending Requests:**  
   - Players have **1 ending request** each.  
   - If both players agree to end, the game concludes.  

---

## Core Functions  

- **`show_results(qc, player_1, player_2)`**  
   - Simulates the final quantum circuit with **10,000 shots**.  
   - Displays the probability distribution using `plot_histogram`.  
   - Declares the winner or announces a tie based on scores.  

- **`make_move(qc, gate_cost)`**  
   - Allows players to select gates and qubits based on their remaining gate points.  
   - Validates and applies moves to the circuit.  

- **`request_end(requests, player_1, player_2)`**  
   - Manages game termination requests.  
   - Deducts request points and handles mutual agreement for ending the game.  

---

## Gameplay Flow  

1. **Initialization:**  
   - Players are assigned **36 gate points** each and **1 request count**.  
   - Game rules and player names are displayed.  

2. **Turn-Based Moves:**  
   - Players alternate applying gates and can propose to end the game.  
   - Gate points and request counts are updated accordingly.  

3. **Game End Conditions:**  
   - Both players agree to stop.  
   - A player exhausts gate points or request counts.  

4. **Result Analysis:**  
   - The circuit is measured, and results are displayed using `show_results`.  

---

## Conclusion  

The **Quantum Tic-Tac-Toe** project combines game strategy with quantum circuits. By combining turn-based gameplay with quantum gate manipulation, players not only compete for victory but also develop an understanding of quantum operations.

This game serves as an interactive platform for learning quantum gates, superposition, and entanglement in a fun and engaging manner. Whether you're a student exploring quantum computing or an enthusiast seeking a unique challenge, **Quantum Tic-Tac-Toe** provides an enjoyable and educational experience.

Step into the quantum arena, make your moves wisely, and explore the quantum world - one gate at a time! ⚛️

## MIT License

```
MIT License

Copyright (c) 2024 [Your Name]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```