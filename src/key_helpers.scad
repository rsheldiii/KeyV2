module arrows(profile, rows = [4,4,4,3]) {
  positions = [[0, 0], [1, 0], [2, 0], [1, 1]];
  legends = ["←", "↓", "→", "↑"];

  for (i = [0:3]) {
    translate_u(positions[i].x, positions[i].y) key_profile(profile, rows[i]) legend(legends[i]) cherry() key(true);
  }
}

module f_cluster(profile, row=5) {
  legends = ["F1", "F2", "F3", "F4"];
  for (i =[0:len(legends)-1]) {
    translate_u(i) key_profile(profile, row) cherry() legend(legends[i]) key(true);
  }
}

module wasd(profile, rows = [2,2,2,1]) {
  positions = [[0, 0], [1, 0], [2, 0], [1, 1]];
  legends = ["A", "S", "D", "W"];

  for (i = [0:3]) {
    translate_u(positions[i].x, positions[i].y) key_profile(profile, rows[i]) legend(legends[i]) cherry() key(true);
  }
}

module row_profile(profile, unsculpted = false) {
  rows = [5, 1, 2, 3, 4];
  for(row = [0:len(rows)-1]) {
    translate_u(0, -row) key_profile(profile, unsculpted ? 3 : rows[row]) children();
  }
}
