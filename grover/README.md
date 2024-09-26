# Grover's Algorithm Project

## Overview

This project demonstrates the implementation of **Grover's Algorithm**, a well-known quantum search algorithm, using Qiskit. The goal is to efficiently find marked states from a search space with a quadratic speedup over classical algorithms. This implementation showcases the following:

- Custom oracle creation for marked states
- Grover operator usage
- Quantum circuit convergence through optimal iterations


## Key Components

### Oracle Construction

The project uses a custom-built oracle for marking specific states. In this example, the oracle marks the states `10011` and `01010`.

The `grover_oracle` function constructs an oracle circuit by:
1. Applying X-gates to the qubits representing 0s in the target states.
2. Using a multi-controlled Toffoli gate (MCMT) with a Z gate to flip the amplitude of the marked states.
3. Reverting the X-gates and adding a barrier for clarity.

```python
def grover_oracle(states):
    if not isinstance(states, list):
        states = [states]

    num_qubits = len(states[0])
    qc = QuantumCircuit(num_qubits)

    for target in states:
        rev_target = target[::-1]
        zero_inds = [ind for ind in range(num_qubits) if rev_target.startswith("0", ind)]
        
        qc.x(zero_inds)
        qc.compose(MCMT(ZGate(), num_qubits - 1, 1), inplace=True)
        qc.x(zero_inds)

        qc.barrier()
    return qc
```

### Grover Operator

The Grover operator is constructed using the oracle circuit. It applies a series of operations:
- Hadamard gates are applied initially to put the qubits in superposition.
- The Grover operator (oracle + diffusion) is applied a specific number of times, determined by the formula:
  
\[
\text{optimal\_iterations} = \left\lfloor \frac{\pi}{4 \cdot \arcsin\left(\sqrt{\frac{\text{marked\_states}}{2^{\text{total\_qubits}}}}\right)} \right\rfloor
\]

This optimal number of iterations maximizes the probability of finding the marked states.

```python
optimal_num_iterations = math.floor(
    math.pi / (4 * math.asin(math.sqrt(len(marked_states) / 2**grover_op.num_qubits)))
)
```

### Circuit Convergence

Grover's algorithm works by amplifying the amplitudes of the marked states with each iteration. Starting with an equal superposition of all possible states, each application of the Grover operator amplifies the probability of measuring the marked states and diminishes the others.

The number of iterations is critical to the success of the algorithm. After a certain number of iterations, determined by the optimal formula, the quantum circuit **converges** to the correct solution with the highest probability.

In this project, the circuit is set to run for the calculated optimal number of iterations. After each iteration, the amplitudes of the marked states (`10011` and `01010`) increase, and the probability of measuring these states converges to 1. Any further iterations would reduce this probability, thus demonstrating the importance of applying Grover's operator the correct number of times.

The output histogram will display high probabilities for the marked states, showcasing the algorithm's success.

## Results

After running Grover's algorithm, the most probable outcomes will correspond to the marked states `10011` and `01010`, as indicated by the amplitude amplification process. The histogram shows these results with high probability, demonstrating the circuit's convergence to the correct answer after the optimal number of iterations.

## Conclusion

This implementation demonstrates the power of Grover's algorithm for solving search problems with quadratic speedup. By running the algorithm for the optimal number of iterations, the circuit reliably converges to the correct marked states, showcasing the effectiveness of quantum algorithms in search tasks.

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