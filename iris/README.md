# Variational Quantum Classifier (VQC) with Qiskit on the Iris Dataset

## Overview

This project demonstrates the implementation of a **Variational Quantum Classifier (VQC)** using Qiskit Machine Learning. The VQC is applied to classify the **Iris dataset** with quantum feature encoding and a variational quantum ansatz. The project compares two different optimizers, **COBYLA** and **P-BFGS**, to see their effect on classification accuracy.

### Key Components:
- **Iris dataset** for classification
- **MinMaxScaler** to scale features between 0 and 2
- **ZZFeatureMap** for quantum feature encoding
- **RealAmplitudes** ansatz as the variational circuit
- **COBYLA** and **P-BFGS** optimizers for training the VQC
- Visualization of both the dataset and the loss landscape during training


## Dataset

The **Iris dataset**, a classic dataset used for machine learning classification tasks, consists of 150 samples of iris flowers with 4 features each. The dataset has 3 classes:
- Setosa
- Versicolor
- Virginica

The dataset is preprocessed by scaling the feature values between 0 and 2 using **MinMaxScaler** to ensure compatibility with quantum feature encoding.

## Circuit Construction

### Quantum Feature Map

The **ZZFeatureMap** is used to encode classical data into quantum states. The feature map creates entanglement between the qubits, helping to transform classical data into a quantum representation suitable for classification tasks.

```python
feature_map = ZZFeatureMap(feature_dimension=num_qubits, reps=2)
```

### Variational Ansatz

The variational ansatz used in this project is **RealAmplitudes**, a parameterized quantum circuit that is optimized during training. The ansatz uses a full entanglement strategy to connect all qubits, helping the VQC learn complex relationships between features.

```python
ansatz = RealAmplitudes(num_qubits=num_qubits, entanglement="full", reps=4)
```

## Optimizers

Two optimizers are used to train the VQC:

1. **COBYLA** - A gradient-free optimizer suitable for variational quantum circuits in noisy environments.
   
   ```python
   optimizer = COBYLA(maxiter=400)
   ```

2. **P-BFGS** - A quantum version of the classical BFGS algorithm that leverages the quantum natural gradient, suitable for noise-free envronments.
   
   ```python
   optimizer = P_BFGS(maxfun=100)
   ```

Both optimizers are tested to compare their performance on the Iris dataset.

## Training and Evaluation

The dataset is split into 80% training and 20% testing sets using **train_test_split**. The **VQC** is then trained using the scaled feature data for both optimizers, and the models' accuracies are evaluated on the test set.

### Results

- **COBYLA Optimizer:** Achieved **76.67% accuracy** on the Iris dataset.
- **P-BFGS Optimizer:** Achieved **73.33% accuracy** on the Iris dataset.
**COBYLA** performed slightly better than **P_BFGS**.

## Conclusion

This project demonstrates how **Variational Quantum Classifiers (VQC)**, using two different optimizers, can be applied to the Iris dataset for classification. The results suggest that while both optimizers perform well, **COBYLA** provided a slightly better accuracy. The project opens up possibilities for further exploration into different optimizers and larger datasets for quantum machine learning.