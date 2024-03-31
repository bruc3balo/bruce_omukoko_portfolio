enum Routes {
  splashScreen('/'),
  home('/home'),
  publications('/publications'),
  skills('/skills'),
  resume('/resume');

  const Routes(this.path);
  final String path;
}
