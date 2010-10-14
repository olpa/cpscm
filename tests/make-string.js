function make_string(n, s) {
  if (! s) s = " ";
  while (s.length < n) {
    s = s + s;
  }
  if (s.length == n) {
    return s;
  }
  return s.substring(0, n);
}
