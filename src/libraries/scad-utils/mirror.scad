// Copyright (c) 2013 Oskar Linde. All rights reserved.
// License: BSD
//
// This library contains simple mirroring functions
//
// mirror_x()
// mirror_y()
// mirror_z()


module mirror_x() {
  union() {
    child();
    scale([-1,1,1]) child();
  }
}

module mirror_y() {
  union() {
    child();
    scale([1,-1,1]) child();
  }
}

module mirror_z() {
  union() {
    child();
    scale([1,1,-1]) child();
  }
}
