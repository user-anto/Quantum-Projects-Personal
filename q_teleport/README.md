# Quantum Teleportation Project

## Project Overview

This project implements and demonstrates the **Quantum Teleportation** protocol using IBM's Qiskit framework. Quantum teleportation is a fundamental protocol in quantum information science, allowing the transfer of a quantum state from one qubit to another, even across significant distances, without physically moving the qubit itself. This process leverages the unique properties of quantum entanglement and superposition.

## Project Structure

- **`q_teleport.ipynb`**: The Jupyter Notebook that contains the complete implementation of the quantum teleportation protocol. This notebook includes:
  - Initialization of quantum and classical registers.
  - Creation of entangled Bell states.
  - Application of quantum gates for Bell-state measurement.
  - Execution of the quantum circuit using Qiskit’s simulators.
  - Analysis of the results to verify successful teleportation.

- **`q_teleport.qasm`**: The OpenQASM File that contaims the code for designing the quantum circuit for Quantum Teleportation protocol.
  - Uncomment line 9 to initialize 'q[0]' as |1>, which otherwise is initialized as |0>.
Paste the code in the OpenQASM editor in the IBM Composer to generate the quantum circuit.

## Prerequisites

### Software Requirements

- **Python 3.7+**: The project is implemented in Python and requires a version compatible with Qiskit.
- **Qiskit**: The quantum computing framework used to create, simulate, and execute quantum circuits.
- **Jupyter Notebook or Jupyter Lab**: For running the notebook and visualizing the quantum circuits.

### Executing the Notebook:

Open `q_teleport.ipynb` and execute the cells in order. The notebook includes detailed explanations and visualizations for each step of the quantum teleportation process.

## Explanation

### 1. Quantum Circuit Design

The quantum teleportation circuit is designed using Qiskit and consists of three qubits and two classical bits:
- **Qubit 0** (`q[0]`): The qubit to be teleported (initially prepared in a specific quantum state).
- **Qubit 1** (`q[1]`): Entangled with Qubit 2 and used in the Bell-state measurement.
- **Qubit 2** (`q[2]`): Initially entangled with Qubit 1 and located at the receiver’s end (Bob).

### 2. Entanglement (Bell State)

The first step involves creating an entangled Bell state between Qubit 1 and Qubit 2:
- **Hadamard Gate (`H`)**: Applied to Qubit 1 to create superposition.
- **CNOT Gate**: Applied with Qubit 1 as the control and Qubit 2 as the target to generate entanglement.

### 3. Bell-State Measurement

Alice performs a Bell-state measurement on Qubit 0 and Qubit 1:
- **CNOT Gate**: Applied with Qubit 0 as the control and Qubit 1 as the target.
- **Hadamard Gate**: Applied to Qubit 0.
- **Measurement**: Qubits 0 and 1 are measured, and the results are stored in classical bits.

### 4. Classical Communication and Correction

Alice sends the measurement results to Bob, who applies the necessary corrective operations on Qubit 2:
- **X Gate**: Applied if the measurement of Qubit 1 is 1.
- **Z Gate**: Applied if the measurement of Qubit 0 is 1.

### 5. Verification

The final state of Qubit 2 is compared with the initial state of Qubit 0 to verify successful teleportation. The quantum circuit is executed on a simulator, and the results are analyzed to confirm that Qubit 2 now holds the original quantum state of Qubit 0.

## Visualization

The notebook includes visual representations of the quantum circuits at each stage of the teleportation process, generated using Qiskit’s circuit drawer.

## Acknowledgements

- This project leverages IBM's Qiskit framework for simulating and visualizing quantum circuits.
- Inspiration and foundational knowledge for this project come from academic resources in quantum computing, including IBM Quantum and "Quantum Computation and Quantum Information" by Nielsen & Chuang.