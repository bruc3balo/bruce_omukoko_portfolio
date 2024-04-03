enum Routes {
  splashScreen('/'),
  home('/home'),
  publications('/publications'),
  skills('/skills'),
  projects('/projects'),
  resume('/resume');

  const Routes(this.path);
  final String path;
}
