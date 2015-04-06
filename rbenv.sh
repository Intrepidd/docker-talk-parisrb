echo 'export HOME=/root' >> ~/.bash_profile
export PATH=$PATH:/root/.rbenv/bin
export RBENV_VERSION=2.1.5
eval "$(rbenv init -)"
CC=gcc rbenv install 2.1.5
rbenv rehash
rbenv global 2.1.5
rbenv rehash
gem install bundler
rbenv rehash
echo 'export PATH="/root/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
echo 'rbenv global 2.1.5' >> ~/.bash_profile
