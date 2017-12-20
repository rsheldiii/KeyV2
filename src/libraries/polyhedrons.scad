function cat(L1, L2) = [for (i=[0:len(L1)+len(L2)-1])
                        i < len(L1)? L1[i] : L2[i-len(L1)]] ;


module dish(type = "sphere", sides = 10, length = 10){

  //TODO length scaling

  function pointyDish(x,y) = (x == 0 || y == 0 || x== sides || y == sides ) ? 0 : abs(5-x) + abs(5-y);

  /*
  matrix looks like this:
  [
  [0, 0, 0], [0, 1, 0], [0, 2, 0],
  [1, 0, 0], [1, 1, 0], [1, 2, 0],
  [2, 0, 0], [2, 1, 0], [2, 2, 0]
  ]
  */
  // row is how many verts are actually in a row
  row = sides + 1;

  // first make an x-first matrix of points. (0,0), (1,0) etc
  matrix = cat([
    for ( y = [0 : sides], x = [ 0 : sides ]) [x, y, pointyDish(x,y)]
  ], [[sides / 2, sides / 2, 0]]);

  echo(matrix);

  echo(matrix[121]);

  echo(len(matrix));

  translate([sides / 2, sides / 2, 0]) sphere(r=1);

  // then make 2 faces for each set of four points: (0,1,4), (0,4,3)
  // sides - 1 because we are doing this fromt the bottom left corner and extending up and out 1 vertex
  // so the rightmost and topmost vertexes are already covered
  f1 = [
    for (y = [0 : sides-1], x = [ 0 : sides-1 ], num = [0, 1]) (
      num == 0 ?
        [(x + row * y), (x + row * y + 1), (x + row * y + 1 + row)] :
        [(x + row * y), (x + row * y + 1 + row), (x + row * y + row)])
  ];

  f2 = cat(f1, [for (n = [0: sides-1]) [n, n+1, len(matrix) - 1]]);

  faces = cat(f2, [for (n = [len(matrix) - sides-1 : len(matrix)]) [n-1, n, len(matrix) - 1]]);
  // add

  /*
  faces needs to start like this:
  [
    [0,1,4,3],
    [1,2,5,4]
  ]*/

  /*index, index + 1, index + 1 + row, index + row*/

  polyhedron(points = matrix, faces=faces);

}

dish();
