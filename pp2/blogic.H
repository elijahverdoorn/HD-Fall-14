/* blogic.h -- implementation of primitives for representing binary logic 
   in C++.     $Revision: 1.1 $ */

inline int band(int a, int b) { return a&b; }
inline int band(int a, int b, int c) { return a&b&c; }
inline int band(int a, int b, int c, int d) { return a&b&c&d; }

inline int bor(int a, int b) { return a|b; }
inline int bor(int a, int b, int c) { return a|b|c; }
inline int bor(int a, int b, int c, int d) { return a|b|c|d; }

inline int bnot(int a) { return 1-a; }

inline int bxor(int a, int b) { return a^b; }

