OPENQASM 2.0;
include "qelib1.inc";

qreg rbg[1];
creg alice_b_[1];
qreg q[2];
creg alice_a_[1];
creg bob_b_[1];
creg bob_a_[1];
qreg out[2];

h rbg[0];
measure rbg[0] -> alice_b_[0];
h rbg[0];
measure rbg[0] -> alice_a_[0];
barrier rbg[0];
barrier q[0];
barrier q[1];
barrier out[0];
barrier out[1];
h q[0];
cx q[0], q[1];
barrier rbg[0];
barrier q[0];
barrier q[1];
barrier out[0];
barrier out[1];
if (alice_b_ == 1) z q[0];
if (alice_a_ == 1) x q[0];
cx q[0], q[1];
h q[0];
measure q[1] -> bob_a_[0];
measure q[0] -> bob_b_[0];
barrier rbg[0];
barrier q[0];
barrier q[1];
barrier out[0];
barrier out[1];
reset rbg[0];
reset q[0];
reset q[1];
if (alice_b_ == 0) x q[0];
if (alice_a_ == 0) x q[1];
if (bob_a_ == 0) x out[1];
if (bob_b_ == 0) x out[0];

// @columns [0,1,2,3,4,4,4,4,4,5,6,7,7,7,7,7,8,9,10,11,11,12,13,13,13,13,13,14,14,14,15,16,17,18]