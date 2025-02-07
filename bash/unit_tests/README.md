## A simple and naive implementation of Unit Testing in Bash

**Note:** if you always need the need to implement unit testing in Bash, it means that you need to switch to either Python, Ansible, or whatever.

This is just for teching and fun purposes.

### How does it work?
> ./test_calculator.sh

1. It sources the System Under Test (in this case calculator.sh)
2. Runs the function to test
3. Does an assertion on the result.