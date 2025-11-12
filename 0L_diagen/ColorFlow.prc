#procedure ColorFlow

********************************fix naming convention according to Recola
mu d_(i2,j2)*d_(i4,j4);

********************************color flow decomposition
* (T_a5)_j^i * sqrt(2) (T_a5)_j5^i5 = sqrt(2)*TF*(cOldel(j,i5)*cOldel(j5,i) - 1/NF*cOldel(j,i)*cOldel(j5,i5))

id cOlT(j0?,i0?,a5?) = pow(2,1/2)*TF*(cOldel(j0,i5)*cOldel(j5,i0) - 1/NF*cOldel(j0,i0)*cOldel(j5,i5));

.sort 

#endprocedure