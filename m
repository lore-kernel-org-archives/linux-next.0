From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the crypto tree
Date: Sat, 20 Jun 2015 16:35:25 +1000
Message-ID: <20150620163525.74961f13@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/A1/PZzoLXf6VeZJ0kRo9nY9"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52174 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751455AbbFTGff (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Jun 2015 02:35:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, Gustavo Padovan <gustavo@padovan.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Vincent <simon.vincent@xsilon.com>, Marcel Holtmann <marcel@holtmann.org>

--Sig_/A1/PZzoLXf6VeZJ0kRo9nY9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

After merging the crypto tree, today's linux-next build (x86_64
allmodconfig) failed like this:

net/mac802154/llsec.c: In function 'llsec_do_encrypt_auth':
/scratch/sfr/next/net/mac802154/llsec.c:675:15: error: 'dst' undeclared (fi=
rst use in this function)
   sg_init_one(dst, skb_put(skb, authlen), authlen);
               ^

Caused by commit:

  7df416952e1e ("Merge remote-tracking branch 'crypto/master'")

I made a small mistake by leaving that line in when I resolved the
conflict.  I have now removed that line.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/A1/PZzoLXf6VeZJ0kRo9nY9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVhQm1AAoJEMDTa8Ir7ZwVk7oQAJLDJEyQ4IJ1Q9izV8HsVVci
nDdnT0KXv/G/RjvjhweTrfuQXtiNd8S1mTgu/Icqwyouh6o4DG70YINHuOdvP8MT
jl/lNL7kAQs5qyNKkmshJi5qr6LLNpJJklkhuVaVpbyADnQ9lxeZUbz+7KIVJLeb
un/dIB0JlHs33sEz5I0aZyVcg9yTa9TBoB2HPJGYQ6or60V74KZ3DOafdjOHliuQ
pY8ZuJ1WGD5/Mo2dwo4qnq8ocOUjNKsvqVYtenJdcLQHpck+23Dg6RE3nAUXj8+q
de/cDBLJB0n4mPVgx5D7kF1odKgspl8byjjUIzpR+vvGwCHdj4G+qFFW5kpowKQL
oYHy+eLX1xUNB/MSPD9Ox++XHDyou+8PnadQFMmUt7N/OA+3boQLuqL39gjgqPIl
a3vyeft4imIiwZLBKLaZpkTAYFG7oSWWj5gxYGT0XCOqgxxdbtOI+2YXjh3xoaEx
h9C2b0Dvq6K3qbXHjU1BethvGQbTC7NMLiSIAsxg67vQh4u4d6Z24Ifrlz7QZfze
3HEqzZC7F6N86s02yYlnPsPdQHsNm54B8jeQu3P+322Gw4Z6NL0zCp+HFPmltpgb
fRxj51BnCjo/I9fXMrCIRuPXb7Qk3EtD/+FiS4I5MWFx8z993cBtzxiuoUhBBuP/
ORwuRvSa7RY5bwhmMbw6
=Sbnb
-----END PGP SIGNATURE-----

--Sig_/A1/PZzoLXf6VeZJ0kRo9nY9--
