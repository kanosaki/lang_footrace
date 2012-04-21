#!/bin/zsh

RUBY19=${HOME}/.rvm/bin/ruby
RUBY18=/usr/bin/ruby
PYTHON2=/usr/bin/python
PYTHON3=/usr/local/bin/python3
JAVA=/usr/bin/java
LISP="/usr/local/bin/sbcl --script "
PHP="/usr/bin/php"


coms=(
  "${PYTHON2} ./python.py"
  "${PYTHON3} ./python.py"
  "${RUBY18} ./ruby.rb"
  "${RUBY19} ./ruby.rb"
  "${JAVA} Java"
  "${LISP} ./lisp"
  "${PHP} ./php.php"
  "./cpp"
  "./haskell"
)

for c in ${coms[*]}; do
  echo -n "$c: "
  result=`/usr/bin/time -p \`echo $c\`  < ./problem 2>&1` 
  echo $result | grep "real" | sed -e "s/real *//g"
done

