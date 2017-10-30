Table[Subscript[f, 1, j] = 0, {j, 2, 69}];

Table[Subscript[f, 50, j] = 0, {j, 2, 69}];

Table[Subscript[f, i, 1] = 0, {i, 2, 49}];

Table[Subscript[f, i, 70] = 100 Sin[Pi 10/49 (-1 + i)/10] // N, {i, 1,
    50}];

sol = CoefficientArrays[Flatten@Table[
     Subscript[f, i + 1, j] + Subscript[f, i, j + 1] + Subscript[f, 
       i - 1, j] + Subscript[f, i, j - 1] - 4 Subscript[f, i, j] == 
      0, {i, 2, 49}, {j, 2, 69}], 
   Flatten@Table[Subscript[f, i, j], {i, 2, 49}, {j, 2, 69}]];

ss = sol[[2]] // Normal;

sa = -sol[[1]] // Normal;

jesus = Flatten@((Inverse@ss).sa);

Export["./tocayo.dat", jesus]
