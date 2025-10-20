module mosaic::router {
    use std::option::Option;
    use std::string::String;
    use aptos_framework::coin::Coin;
    use aptos_framework::fungible_asset::{FungibleAsset, Metadata};
    use aptos_framework::object::Object;

    /// Entry function to swap token for token.
    ///
    /// # Type parameters
    ///
    /// - `T1` -> `T15`: The type paramaters for the swap. These values are returned by the Mosaic backend.
    ///
    /// # Parameters
    ///
    /// - `_sender`: The signer of the transaction.
    /// - `_arg1` -> `_arg14`: The arguments for the swap, these values are returned by the Mosaic backend.
    public entry fun swap<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15>(
        _sender: &signer,
        _arg1: address,
        _arg2: bool,
        _arg3: vector<u64>,
        _arg4: vector<u64>,
        _arg5: vector<u64>,
        _arg6: vector<address>,
        _arg7: vector<address>,
        _arg8: address,
        _arg9: u64,
        _arg10: bool,
        _arg11: u64,
        _arg12: u64,
        _arg13: String,
        _arg14: String,
    ) {
        abort 0
    }

    /// Swap token for token.
    ///
    /// # Type parameters
    ///
    /// - `T1` -> `T15`: The type paramaters for the swap. These values are returned by the Mosaic backend.
    ///
    /// # Parameters
    ///
    /// - `_input_coin`: The input coin if the input token is a coin. Pass coin::zero() if the input token is a fungible asset.
    /// - `_input_fa`: The input fungible asset if the input token is a fungible asset. Pass option::none() if the input token is a coin.
    /// - `_arg1` -> `_arg13`: The arguments for the swap, these values are returned by the Mosaic backend.
    ///
    /// # Returns
    ///
    /// - `Coin<T1>`: The remaining coin of the input token if the input token is a coin.
    ///             It is coin::zero() if the input token is a fungible asset or the input token is fully swapped.
    /// - `Option<FungibleAsset>`: The remaining fungible asset of the input token if the input token is a fungible asset.
    ///            It is option::none() if the input token is a coin or the input token is fully swapped.
    /// - `Coin<T2>`: The swapped coin if the output token is a coin. It is coin::zero() if the output token is a fungible asset.
    /// - `Option<FungibleAsset>`: The swapped fungible asset if the output token is a fungible asset.
    ///             It is option::none() if the output token is a coin.
    public fun swap_direct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15>(
        _input_coin: Coin<T1>,
        _input_fa: Option<FungibleAsset>,
        _arg1: bool,
        _arg2: vector<u64>,
        _arg3: vector<u64>,
        _arg4: vector<u64>,
        _arg5: vector<address>,
        _arg6: vector<address>,
        _arg7: address,
        _arg8: u64,
        _arg9: bool,
        _arg10: u64,
        _arg11: u64,
        _arg12: String,
        _arg13: String,
    ): (Coin<T1>, Option<FungibleAsset>, Coin<T2>, Option<FungibleAsset>) {
        abort 0
    }

    public fun get_input_fa_metadata(_arg0: &vector<u64>, _arg1: &vector<address>): Option<Object<Metadata>> {
        abort 0
    }

    /// **Deprecated**: use `get_input_amount_needed` instead.
    public fun get_input_amount(_arg0: &vector<u64>, _arg1: u64, _arg2: bool): u64 {
        abort 0
    }

    public fun get_input_amount_needed<X, Y>(
        _arg0: vector<u64>,
        _arg1: vector<address>,
        _arg2: &vector<u64>,
        _arg3: u64,
        _arg4: bool,
    ): u64 {
        abort 0
    }
}