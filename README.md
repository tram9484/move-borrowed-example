Cannot compile:

```
aptos move compile
```

Got this:

```
➜  borrowed-example git:(master) aptos move compile
error[E07004]: invalid return of locally borrowed state
   ┌─ /Users/0xbe1/web3/borrowed-example/sources/my_table.move:18:9
   │
18 │         borrow_global<MyTable>(@borrowed_example)
   │         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   │         │
   │         Invalid return. Resource variable 'MyTable' is still being borrowed.
   │         It is still being borrowed by this reference

error[E07004]: invalid return of locally borrowed state
   ┌─ /Users/0xbe1/web3/borrowed-example/sources/my_table.move:22:9
   │
22 │         borrow_global_mut<MyTable>(@borrowed_example)
   │         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   │         │
   │         Invalid return. Resource variable 'MyTable' is still being borrowed.
   │         It is still being mutably borrowed by this reference
```
