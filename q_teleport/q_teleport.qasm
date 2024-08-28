OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg b[1];
creg a[1];

h q[1];
cx q[1], q[2];
barrier q[0];
barrier q[1];
barrier q[2];
x q[0];
barrier q[0];
barrier q[1];
barrier q[2];
cx q[0], q[1];
h q[0];
measure q[0] -> b[0];
measure q[1] -> a[0];
if (a == 1) x q[2];
if (b == 1) z q[2];

// @columns [0,1,2,2,2,3,4,4,4,5,6,7,8,9,10]