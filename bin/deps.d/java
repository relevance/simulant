# Checking Java Install    -*- sh -*-

ORACLE_OSX_JDK_HOME=$(ls -1d /Library/Java/JavaVirtualMachines/jdk1.7*.jdk/Contents/Home 2>/dev/null || echo "Cannot Be Found")
UBUNTU_JDK_HOME=$(ls -1d /usr/lib/jvm/jdk1.6* 2>/dev/null || echo "Cannot Be Found")

if [ "" = "$JAVA_HOME" ] ; then
    if [ -d /System/Library/Frameworks/JavaVM.framework/Home ] ; then
        JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
        remember "JAVA_HOME" "${JAVA_HOME}"
    elif [ -d "${ORACLE_OSX_JDK_HOME}" ] ; then
        JAVA_HOME=${ORACLE_OSX_JDK_HOME}
        remember "JAVA_HOME" "${JAVA_HOME}"
    elif [ -d "${UBUNTU_JDK_HOME}" ] ; then
        JAVA_HOME=${UBUNTU_JDK_HOME}
        remember "JAVA_HOME" "${JAVA_HOME}"
    fi
fi

if [ ! -f "${JAVA_HOME}/bin/java" ] ; then
  die "Could not find a valid Java install using JAVA_HOME=${JAVA_HOME}"
fi

if [ ! -d "${JAVA_HOME}/include" ] ; then
  echo "Fixing funky Apple JDK install"
  sudo ln -s /System/Library/Frameworks/JavaVM.framework/Headers "${JAVA_HOME}/include" || die "Could not create Java header symlink"
fi
export JAVA_HOME
