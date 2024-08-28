# Superdense Coding Project

## Project Overview

This project showcases the implementation of **Superdense Coding** using Qiskit, IBM's quantum computing framework. Superdense coding is a quantum communication protocol that allows the transmission of two classical bits of information using only one qubit, leveraging quantum entanglement. This protocol demonstrates one of the fundamental advantages of quantum communication over classical methods.

## Project Structure

- **`superdense.ipynb`**: The main Jupyter Notebook file that includes the complete implementation of the superdense coding protocol. The notebook is structured to:
  - Initialize quantum and classical registers.
  - Create entangled states (Bell states).
  - Encode classical information into quantum states.
  - Decode the transmitted quantum state back into classical information.
  - Simulate the quantum circuit and analyze the results.

- **`superdense.qasm`**: The OpenQASM File that contaims the code for designing the quantum circuit for Superdense Coding protocol.
Paste the code in the OpenQASM editor in the IBM Composer to generate the quantum circuit.

## Prerequisites

### Software Requirements

- **Python 3.7+**: Required for running the project.
- **Qiskit 1.1.0+**: The quantum computing library used to build and simulate quantum circuits.
- **Jupyter Notebook or Jupyter Lab**: Necessary for running and visualizing the notebook.

### Executing the Notebook:

Open the `superdense.ipynb` file in your browser and execute the cells sequentially. The notebook contains detailed explanations and visual aids to guide you through each step of the superdense coding protocol.

## Technical Explanation

### 1. Quantum Circuit Design

The quantum circuit for superdense coding is designed with two qubits (`q[0]` and `q[1]`) and two classical bits (`c[0]` and `c[1]`):
- **Qubit 0** (`q[0]`): Initially prepared by Alice and sent to Bob after encoding classical information.
- **Qubit 1** (`q[1]`): Entangled with Qubit 0 and remains with Bob for decoding.

### 2. Entanglement (Bell State Creation)

The first step is to create an entangled pair of qubits (a Bell state):
- **Hadamard Gate (`H`)**: Applied to Qubit 0 to create a superposition state.
- **CNOT Gate**: Applied with Qubit 0 as the control and Qubit 1 as the target, generating an entangled state.

### 3. Information Encoding

Alice encodes two classical bits of information (00, 01, 10, or 11) into the entangled qubit (`q[0]`) using a combination of quantum gates:
- **Identity Gate (`I`)**: Encodes `00` by leaving the state unchanged.
- **X Gate**: Encodes `01` by flipping the state of Qubit 0.
- **Z Gate**: Encodes `10` by applying a phase flip to Qubit 0.
- **XZ Gate**: Encodes `11` by flipping both the state and the phase of Qubit 0.

### 4. Information Decoding

Bob decodes the received qubit using the following gates:
- **CNOT Gate**: Applied with Qubit 0 as the control and Qubit 1 as the target to disentangle the qubits.
- **Hadamard Gate (`H`)**: Applied to Qubit 0 to complete the decoding process.

The resulting classical bits from Bob's measurements are compared with Alice's original bits to confirm the success of the superdense coding protocol.

### 5. Simulation and Results

The quantum circuit is simulated using Qiskit’s Aer simulator. The final measurement results are analyzed to verify that the correct classical information is transmitted using only one qubit.

## Visualization

The notebook includes visualizations of the quantum circuits used in the superdense coding process, along with output plots for measurement results, generated using Qiskit’s tools.

## Acknowledgements

- This project was built using IBM’s Qiskit framework.
- The theoretical foundation is based on standard quantum information protocols and the "Quantum Computation and Quantum Information" textbook by Nielsen & Chuang.