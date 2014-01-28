# Ruby   -*- sh -*-

if rvm version >/dev/null 2>&1; then
  SELECT_RUBY="rvm use 1.8"
  SUDO_GEM=""
else
  SELECT_RUBY="date"
  SUDO_GEM="sudo"
fi

ruby --version | grep '1.8' >/dev/null || die "You must be on Ruby 1.8. rvm use 1.8 ?"
gem --version | grep -E '1.8.5|1.6.2|1.3.6' >/dev/null || die "You must be on RubyGems 1.8.5. 'rvm rubygems 1.8.5' ?"
