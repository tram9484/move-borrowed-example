
# move-borrowed-example

## Overview

`move-borrowed-example` is a Move module that demonstrates the use of `IterableTable` in Aptos, allowing key-value storage with borrowing capabilities. This example provides functions to create, modify, and retrieve values from a global table.

## Features

-   **Create a new table**: Initializes an empty `IterableTable`.
    
-   **Borrow the table**: Allows immutable access to the stored data.
    
-   **Borrow the table mutably**: Allows mutable access to modify the table.
    
-   **Add entries**: Insert key-value pairs into the table.
    
-   **Get entries**: Retrieve values associated with specific keys.
    
-   **Test function**: Demonstrates the correct functionality of adding and retrieving values.
    

## Installation

Ensure you have the Aptos CLI and Move tools installed. Clone this repository and navigate to the project directory:

```
aptos move compile
```

## Module Structure

### `struct MyTable`

```
struct MyTable has key {
    it: IterableTable<u64, u64>
}
```

This structure represents a key-value storage using `IterableTable`.

### Functions

-   `public fun new(): MyTable`
    
    -   Creates and returns a new instance of `MyTable`.
        
-   `public fun borrow(): &MyTable acquires MyTable`
    
    -   Returns an immutable reference to the global table.
        
-   `public fun borrow_mut(): &mut MyTable acquires MyTable`
    
    -   Returns a mutable reference to the global table.
        
-   `public fun add(mt: &mut MyTable, k: u64, v: u64)`
    
    -   Inserts a key-value pair into the table.
        
-   `public fun get(mt: &MyTable, k: u64): &u64`
    
    -   Retrieves a value from the table based on the given key.
        

### Test Function

```
#[test(account = @borrowed_example)]
public fun add_ok(account: &signer) acquires MyTable {
    move_to(account, new());

    let m_mt = borrow_mut();
    add(m_mt, 1, 1);

    let mt = borrow();
    assert!(get(mt, 1) == &1u64, 0);
}
```

This test function verifies that adding and retrieving a value works correctly.

## Usage

Deploy and interact with the module using Aptos CLI:

```
aptos move publish
```

To execute functions, use:

```
aptos move run --function borrowed_example::my_table::add --args <key> <value>
```

## License

This project is open-source under the MIT License.
