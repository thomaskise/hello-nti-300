
Run test script with input

Test for package

If package is installed then exit
 else prompt for input
If input yes, install package
If no echo package not installed 
end script

Test for package is on

If on then exit
Else prompt for input
If input yes then start package
Else end script

If end script and installed and active
Echo package is ready
Else echo package not installed

main script = user_test.sh
  chmod +x package_install_test.sh
  ./package_install_test.sh
  
  chmod +x package_on_test.sh
  ./package_on_test.sh
  

test for install = package_install_test.sh

test for on = package_on_test.sh
