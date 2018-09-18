From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the jc_docs tree
Date: Tue, 18 Sep 2018 10:14:44 +1000
Message-ID: <20180918101444.6466090c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/klpMMgpWX4ekdlopQM4qc3T"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Henrik Austad <henrik@austad.us>, "Tobin C. Harding" <me@tobin.cc>
List-Id: linux-next.vger.kernel.org

--Sig_/klpMMgpWX4ekdlopQM4qc3T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  Documentation/networking/00-INDEX

between commit:

  a7ddcea58ae2 ("Drop all 00-INDEX files from Documentation/")

from the jc_docs tree and commit:

  a20625e49dde ("docs: net: Remove TCP congestion document")

from the net-next tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/klpMMgpWX4ekdlopQM4qc3T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlugQ3QACgkQAVBC80lX
0GxVfAf/YNLUgt7tJInWBu1JIXC8DPu4YIjBuqgCcLi9Mry7haVJ4T+bxp8adM3Z
59jsn7vPOBtCjGtlBoDUITlypkZnaDVtVFaSJ0ZTnyfP6ASzJ58nUWZqGWZ1Fw92
pU9f2D2wScJc1LoaN2Ds8jkB28sVDcWv3raDZ1FesGsoq7oPMZ6NjZZw6I2+tvf3
So4EQQ9JT64jVzHPd5yVpHvHDBB1ze9wixqsLzdS9KNEbfmUjKVn0lm+AiM7j+tJ
6nllx8g5GSyyT6HdDLc4daxvunw3Dp1lbn6gtRJJQfxBv7gxbvCj94WJwnGsqo2u
8zxCU7iG9jFET7jwW22jvF0naa8yVQ==
=R0rL
-----END PGP SIGNATURE-----

--Sig_/klpMMgpWX4ekdlopQM4qc3T--
