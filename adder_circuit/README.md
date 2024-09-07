# Quantum Adder Circuit Project

## Overview

This project demonstrates the design and implementation of a quantum adder using Qiskit. A quantum adder circuit adds two quantum registers and produces the result in the form of a quantum state. The project explores the creation of a quantum adder using controlled quantum gates and registers.

## Project Structure

- **`adder.ipynb`**: Contains the Jupyter notebook with the main implementation of the quantum adder, particularly the `get_qc_for_adder()` function.
- **`adder.qasm`**: The OpenQASM File that contains the code for designing the quantum circuit for a 3-bit Adder-Circuit.
    - Uncomment lines 9-14 to initialize qubits as combinations of |1> and |0>. Output is supported upto 3 bits i.e., |111>. Read outputs at the qubits marked with a barrier at the end.
Paste the code in the OpenQASM editor in the IBM Composer to generate the quantum circuit.

## Key Components

### Quantum Adder Circuit

The core component of this project is the quantum adder function, which constructs a quantum circuit to add two quantum registers of qubits. The function uses Toffoli (`CCX`) and CNOT (`CX`) gates for the addition process and includes carry-in and carry-out operations. 

The function is defined as:

```python
def get_qc_for_adder(bits):
    qubits = 2*bits + 2
    carry_out = qubits - 2
    carry_in = qubits - 1
    qc = QuantumCircuit(qubits, bits)
    i = 0
    while(i < carry_out):
        qc.ccx(i, i+1, carry_out)     # Toffoli gate to handle carry
        qc.cx(i, i+1)                 # CNOT gate for bit addition
        qc.reset(i)                   # Reset the qubits after operation

        if (i+2) == carry_out:
            break
        
        qc.ccx(i+2, carry_out, carry_in)  # Toffoli gate for carry propagation
        qc.cx(carry_out, i+2)             # CNOT for sum bits
        qc.reset(carry_out)               # Reset carry-out
        qc.cx(carry_in, carry_out)        # Final adjustment for carry bits
        qc.reset(carry_in)                # Reset carry-in
        
        i += 2
    
    # Measure sum bits
    qc.measure([(i*2 + 1) for i in range(bits)], range(bits))

    return qc
```

### Function Explanation

1. **Inputs**:
    - `bits`: The number of bits (qubits) for each quantum register being added.
   
2. **Qubit Allocation**:
    - A total of `2*bits + 2` qubits are allocated:
      - `2*bits`: For the two quantum registers being added.
      - `+2`: For the carry-in and carry-out qubits.

3. **Carry-In and Carry-Out**:
    - `carry_out` and `carry_in` qubits are positioned at the last two qubits in the circuit. They handle the carry operations in the quantum adder.

4. **Loop Construction**:
    - The function iterates over the qubits, applying a series of **Toffoli gates (CCX)** and **CNOT gates (CX)**. The Toffoli gate is used for the controlled addition and handling of carry bits, while the CNOT gate is used to compute the sum of the corresponding qubits.
    - After each operation, the qubits are reset to ensure no residual quantum information is left before the next iteration.

5. **Measurement**:
    - The sum bits (result of the addition) are measured at the end of the process. The function measures every second qubit in the range, where the sum is stored.

### Technical Considerations

- **Gate Complexity**: The circuit primarily uses controlled gates such as CCX (Toffoli) and CX (CNOT), which introduce a level of complexity due to the need for multiple qubit interactions. These gates are crucial for implementing logical operations like addition in a quantum system.
  
- **Error Mitigation**: The `qc.reset()` statements are used to clear the qubits after an operation to prevent any interference from leftover quantum states. This ensures that each operation in the loop works with clean qubits, minimizing potential quantum error buildup.

- **Optimization Potential**: While this implementation works for small numbers of qubits, further optimization using Qiskit's transpilation tools (e.g., optimization levels, dynamical decoupling) may improve performance for larger circuits. Additionally, reducing gate depth and using error correction techniques would improve the reliability of the circuit on noisy quantum hardware.


### Testing the Adder Circuit

- **Unit Testing**: The adder circuit can be tested by running it on simulators and verifying that the output matches expected binary additions. Noise models can be added to simulate real quantum environments.
  
- **Performance Testing**: Evaluate the circuit performance by running it on various backends (noisy simulators or real quantum computers) to see how well it handles qubit noise and gate errors.

## Conclusion

This project provides a simple yet efficient implementation of a quantum adder circuit. By leveraging controlled gates and resetting qubits after operations, the circuit performs binary addition on quantum registers while keeping the qubit usage and gate depth manageable. Future enhancements could explore more advanced quantum arithmetic circuits and error correction techniques to make the adder suitable for larger and more practical quantum computing applications.

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