# rex -*- sh -*-

rex_check() {
  ${TOP_DIR}/bin/rex -v >/dev/null 2>&1
}

rex_uninstall() {
  rm -rf "${TOP_DIR}/lib/perl"
}

rex_install() {
  if ${PKG}_check rex ; then
    echo "rex already installed"
  else
    # http://stackoverflow.com/questions/2980297/how-can-i-use-cpan-as-a-non-root-user
    if [ ! -f /tmp/rex-cpan ] ; then
      curl -o /tmp/rex-cpan -L get.rexify.org
    fi
    cat /tmp/rex-cpan | perl - -l "${TOP_DIR}/lib/perl" App::cpanminus local::lib
    ${TOP_DIR}/lib/perl/bin/cpanm --local-lib="${TOP_DIR}/lib/perl" Rex
    ${TOP_DIR}/bin/rex -v
    echo
    echo
    echo You are ready to automate.. Try running: rex -T to see list tasks available
  fi
}

rex_status() {
  echo
}

rex_start() {
  echo
}

rex_stop() {
  echo
}

rex_restart() {
  echo
}
