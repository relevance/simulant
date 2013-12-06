# Rake  -*- sh -*-

rake_check() {
  ${SUDO_GEM} gem list rake | grep rake >/dev/null
}

rake_install() {
  if rake_check ; then
    echo "Rake already installed"
  else
    ${SUDO_GEM} gem install rake --no-rake --no-ri
  fi
}

rake_uninstall() {
  ${SUDO_GEM} gem uninstall -a rake
}
