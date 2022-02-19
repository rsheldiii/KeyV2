module filled_stem(_depth, _slop, _throw) {
  // I broke the crap out of this stem type due to the changes I made around how stems are differenced
  // now that we just take the dish out of stems in order to support stuff like
  // bare stem keycaps (and buckling spring eventually) we can't just make a
  // cube. shape() works but means that you certainly couldn't render this
  // stem without the presence of the entire library

  shape($wall_thickness);
}
