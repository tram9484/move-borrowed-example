module borrowed_example::my_table {
    use aptos_std::iterable_table::{Self, IterableTable};

    #[test_only]
    use std::signer;

    struct MyTable has key {
        it: IterableTable<u64, u64>
    }

    public fun new(): MyTable {
        MyTable {
            it: iterable_table::new<u64, u64>()
        }
    }

    public fun borrow(): &MyTable acquires MyTable {
        borrow_global<MyTable>(@borrowed_example)
    }

    public fun borrow_mut(): &mut MyTable acquires MyTable {
        borrow_global_mut<MyTable>(@borrowed_example)
    }

    public fun add(mt: &mut MyTable, k: u64, v: u64) {
        iterable_table::add(&mut mt.it, k, v)
    }

    public fun get(mt: &MyTable, k: u64): &u64 {
        iterable_table::borrow(&mt.it, k)
    }

    #[test(account = @borrowed_example)]
    public fun add_ok(account: &signer) acquires MyTable {
        move_to(account, new());

        let m_mt = borrow_mut();
        add(m_mt, 1, 1);

        let mt = borrow();
        assert!(get(mt, 1) == &1u64, 0);
    }
}