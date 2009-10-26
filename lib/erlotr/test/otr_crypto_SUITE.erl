-module(otr_crypto_SUITE).

-author("Stefan Grundmann <sg2342@googlemail.com>").

-include("AesTestVectors.hrl").

-compile(export_all).


init_per_suite(Config) -> 
    case application:start(crypto) of
	ok -> [{stop_crypto, true} |Config];
	{error, {already_started, crypto}} -> Config
    end.

end_per_suite(Config) -> 
    case proplists:lookup(stop_crypto, Config) of
	{stop_crypto, true} -> application:stop(crypto);
	_ -> ok
    end, Config.

init_per_testcase(_TestCase, Config) -> Config.

end_per_testcase(_TestCase, Config) -> Config.


all() -> [aes_ctr_128_1, aes_ctr_128_2, aes_ctr_128_3, 
	  aes_ctr_128_4, aes_ctr_128_5, aes_ctr_128_6].

%F{{{ aes_ctr_128_...

aes_ctr_128_1(_Config) -> 
    ct:comment("AES testvector #1 (16 bytes plaintext)"),
    {Key, Nonce, Plaintext, Ciphertext} = ?AESTestVector1,
    Ciphertext = otr_crypto:aes_ctr_128_encrypt(Key, Nonce, Plaintext),
    Plaintext = otr_crypto:aes_ctr_128_decrypt(Key, Nonce, Ciphertext), ok.

aes_ctr_128_2(_Config) -> 
    ct:comment("AES testvector #2 (32 bytes plaintext)"),
    {Key, Nonce, Plaintext, Ciphertext} = ?AESTestVector2,
    Ciphertext = otr_crypto:aes_ctr_128_encrypt(Key, Nonce, Plaintext),
    Plaintext = otr_crypto:aes_ctr_128_decrypt(Key, Nonce, Ciphertext), ok.

aes_ctr_128_3(_Config) -> 
    ct:comment("AES testvector #3 (32 bytes plaintext)"),
    {Key, Nonce, Plaintext, Ciphertext} = ?AESTestVector3,
    Ciphertext = otr_crypto:aes_ctr_128_encrypt(Key, Nonce, Plaintext),
    Plaintext = otr_crypto:aes_ctr_128_decrypt(Key, Nonce, Ciphertext), ok.

aes_ctr_128_4(_Config) -> 
    ct:comment("AES testvector #4 (45 bytes plaintext)"),
    {Key, Nonce, Plaintext, Ciphertext} = ?AESTestVector4,
    Ciphertext = otr_crypto:aes_ctr_128_encrypt(Key, Nonce, Plaintext),
    Plaintext = otr_crypto:aes_ctr_128_decrypt(Key, Nonce, Ciphertext), ok.

aes_ctr_128_5(_Config) -> 
    ct:comment("AES testvector #5 (256 bytes plaintext)"),
    {Key, Nonce, Plaintext, Ciphertext} = ?AESTestVector5,
    Ciphertext = otr_crypto:aes_ctr_128_encrypt(Key, Nonce, Plaintext),
    Plaintext = otr_crypto:aes_ctr_128_decrypt(Key, Nonce, Ciphertext), ok.

aes_ctr_128_6(_Config) -> 
    ct:comment("AES testvector #6 (1024 bytes plaintext)"),
    {Key, Nonce, Plaintext, Ciphertext} = ?AESTestVector6,
    Ciphertext = otr_crypto:aes_ctr_128_encrypt(Key, Nonce, Plaintext),
    Plaintext = otr_crypto:aes_ctr_128_decrypt(Key, Nonce, Ciphertext), ok.

%}}}F
