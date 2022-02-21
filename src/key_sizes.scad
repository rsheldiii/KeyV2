// key width functions

module u(u=1) {
  $key_length = u;
  children();
}

module 1u() {
  u(1) children();
}

module 1_25u() {
  u(1.25) children();
}

module 1_5u() {
  u(1.5) children();
}

module 1_75u(){
  u(1.75) children();
}

module 2u() {
  u(2) children();
}

module 2_25u() {
  u(2.25) children();
}

module 2_50u() {
  u(2.5) children();
}

module 2_75u() {
  u(2.75) children();
}

module 6_25u() {
  u(6.25) children();
}

// key height functions

module uh(u=1) {
  $key_height = u;
  children();
}

module 1uh() {
  uh(1) children();
}

module 2uh() {
  uh(2) children();
}

module 1_25uh() {
  uh(1.25) children();
}

module 1_5uh() {
  uh(1.5) children();
}

module 2_25uh() {
  uh(2.25) children();
}

module 2_75uh() {
  uh(2.75) children();
}

module 6_25uh() {
  uh(6.25) children();
}
