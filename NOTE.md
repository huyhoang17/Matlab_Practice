feval: bieu thuc ham
---

feval(fun, a)  # fun: function-handle, string

```
fun = ‘round’ | fun1 = @round

feval(fun, pi) | feval(fun1, pi)
```

subs: Symbolic substitution
---

feval(fun, a)  # fun: function-handle

```matlab
fun = @(x) 2 * x + 3

subs(fun, 1)
```

sym: Create symbolic variables, expressions, functions, matrices
---

```matlab
a = sym('a', [1 4])
% [ a1, a2, a3, a4]
```

> https://www.mathworks.com/help/symbolic/sym.html?searchHighlight=sym&s_tid=doc_srchtitle
