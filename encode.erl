-module(encode).

-export([encode/1, decode/1]).
 

% This encrypt method takes Data that is in binary() and encrypts it with a key that consists of a binarylist of N amount of values.
% The same key is then going to be used in decode to recieve the correct message.
encode(Data) -> 
	%Key = input_key_here,
	% Key example. Key = <<170,95,52,220,31,144,244,183,82,114,245,228,80,238,23,200>>
	Key = <<170,95,52,220,31,144,244,183,82,114,245,228,80,238,23,200>>,
    
    crypto:block_encrypt(aes_cfb128, Key, Key,  Data).

% This decrypt method takes a binarylist of encrypted data and using the same key as encode it decodes it correctly into a normal list.
decode(EncryptedData) ->
	%Key = input_key_here,
	% Key example. Key = <<170,95,52,220,31,144,244,183,82,114,245,228,80,238,23,200>>
	Key = <<170,95,52,220,31,144,244,183,82,114,245,228,80,238,23,200>>,

	binary_to_list(crypto:block_decrypt(aes_cfb128, Key, Key,  EncryptedData)).
