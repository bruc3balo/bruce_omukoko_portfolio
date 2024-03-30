enum Routes {
  splashScreen('/'),
  home('/home'),
  publications('/publications'),
  resume('/resume');

  const Routes(this.path);
  final String path;
}
