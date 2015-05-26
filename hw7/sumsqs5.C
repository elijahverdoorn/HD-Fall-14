/* iteration homework in c++. Elijah Verdoorn 9/14 */

#include <iostream>
#include <cmath>
using namespace std;

main()
{
  int n, ans; 
  cout << "Enter a positive integer:" << endl;
  cin >> n;
  for (int i = 0; i <= n; i++)
    {
      ans = ans + i*i;
    }
  cout << "sum of the first " << n << " squares is " << ans << endl;

}
