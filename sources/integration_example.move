module example::integration_example {

    use std::option;
    use std::signer;
    use std::string::String;
    use aptos_framework::coin;
    use aptos_framework::primary_fungible_store;
    use mosaic::router;

    /// This example function demonstrates how to integrate with Mosaic.
    /// This calls the `swap_direct` function in the `router` module to swap tokens.
    public entry fun example<
        // You can add more type parameters for your business logic.
        // X, Y, Z,...
        // The type paramaters for the swap. These values are returned by the Mosaic backend.
        T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15,
    >(
        sender: &signer,
        // you can add more parameters for your business logic.

        // The parameters `arg1` to `arg14` are returned by the Mosaic backend.
        arg1: bool,
        arg2: vector<u64>,
        arg3: vector<u64>,
        arg4: vector<u64>,
        arg5: vector<address>,
        arg6: vector<address>,
        arg7: address,
        arg8: u64,
        arg9: bool,
        arg10: u64,
        arg11: u64,
        arg12: String,
        arg13: String,
    ) {
        let sender_address = signer::address_of(sender);

        // Step 1. Get input token and amount.
        let input_amount = router::get_input_amount(&arg2, arg8, arg9);
        let input_fa_metadata_opt = router::get_input_fa_metadata(&arg3, &arg5);
        // Check if the input token is fungible asset. False if the input token is coin.
        let input_is_fa = option::is_some(&input_fa_metadata_opt);

        // Step 2. Get input token from somewhere. In this example, we just withdraw the input token from the sender.
        let (input_coin, input_fa) = if (input_is_fa) {
            let input_fa_metadata = option::destroy_some(input_fa_metadata_opt);

            (coin::zero<T1>(), option::some(primary_fungible_store::withdraw(sender, input_fa_metadata, input_amount)))
        } else {
            (coin::withdraw<T1>(sender, input_amount), option::none())
        };

        // Step 3. Call the `swap_direct` function in the `router` module to swap tokens.
        let (
            input_coin_left, input_fa_left,
            output_coin, output_fa,
        ) = router::swap_direct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15>(
            input_coin,
            input_fa,
            arg1,
            arg2,
            arg3,
            arg4,
            arg5,
            arg6,
            arg7,
            arg8,
            arg9,
            arg10,
            arg11,
            arg12,
            arg13,
        );

        // Step 4. Do your own logic with the remaining input token and the output token.

        // Check remaining input token and do your own logic with the remaining input token.
        // In this example, we just deposit the remaining token back to the sender.
        if (input_is_fa) {
            if (option::is_some(&input_fa_left)) {
                primary_fungible_store::deposit(sender_address, option::destroy_some(input_fa_left));
            } else {
                option::destroy_none(input_fa_left);
            };
            coin::destroy_zero(input_coin_left);
        } else {
            coin::deposit(sender_address, input_coin_left);
            option::destroy_none(input_fa_left);
        };

        // Do your own logic with the output token.
        // In this example, we just deposit the output token to the sender.
        if (option::is_some(&output_fa)) {
            primary_fungible_store::deposit(sender_address, option::destroy_some(output_fa));
            coin::destroy_zero(output_coin);
        } else {
            coin::deposit(sender_address, output_coin);
            option::destroy_none(output_fa);
        }
    }
}