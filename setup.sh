#!/bin/bash
PY_VER=3.6.2

source ~/.bash_profile

sudo yum -y install zlib tk-devel tcl-devel ncurses-devel gdbm-devel db4-devel readline-devel zlib-devel \
  bzip2-devel sqlite-devel openssl-devel libXext.x86_64 libSM.x86_64 libXrender.x86_64 gcc  gcc-c++  libffi-devel python-devel patch
sudo yum install -y tk.x86_64 tk-devel.x86_64 tkinter.x86_64

pyenv_install() {
  # skip installation when pyenv is already installed.
  if [ `pyenv --version > /dev/null 2>&1; echo $?` == 0 ]; then
    echo '.pyenv is already installed.(skipping...)'
    return
  fi

  # pyenv
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv;
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile;
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile;
  echo 'eval "$(pyenv init -)"' >> ~/.bash_profile;

  # virtualenv
  git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv;
  echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile;

  source ~/.bash_profile;
}

pyenv_install

if [ `pyenv versions | grep "${PY_VER}" > /dev/null 2>&1; echo $?` == 0 ]; then
  echo "python ${PY_VER} is already installed.(skipping...)"
else
  pyenv install ${PY_VER}
fi


source ~/.bash_profile

################
# Install meacb
################
# Install mecab
sudo rpm -ivh http://packages.groonga.org/centos/groonga-release-1.1.0-0.noarch.rpm
sudo yum install mecab mecab-devel mecab-ipadic -y


echo ''
echo '#####################################'
echo '# Run followings after installation'
echo '#####################################'
echo "pyenv virtualenv ${PY_VER} {Your name of virtualenv}"
echo 'cp requirements.txt {project dir}'
echo 'cd {project dir}'
echo "pip install -r requirements.txt"
