/* iteration homework in c++. Elijah Verdoorn 9/14 */

#include <iostream>
#include <cmath>
using namespace std;

main()
{
  int n, ans, i = 0;
  cout << "Enter a positive integer:" << endl;
  cin >> n;
  do
    {
      ans = ans + i*i;
      i++;
    }
  while (i <= n);
  cout << "sum of the first " << n << " squares is " << ans << endl;
}
