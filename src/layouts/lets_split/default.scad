module lets_split_default(profile) {
  for(x = [1:1:4]) {
    for(y=[-2.5:0.5:3]) {
      translate_u(y > 0 ? y * 2 + 1 : y * 2,-x) key_profile(profile, x,floor(y)) {
        key();
      }
    }
  }
}
