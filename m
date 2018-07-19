From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 19 Jul 2018 11:25:02 +1000
Message-ID: <20180719112502.14cbe80a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CXRQpIDxX.rJEPn13Ifp4Bi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefano Brivio <sbrivio@redhat.com>, Boris Pismenny <borisp@mellanox.com>, Ilya Lesokhin <ilyal@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/CXRQpIDxX.rJEPn13Ifp4Bi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  include/linux/skbuff.h

between commit:

  8b7008620b84 ("net: Don't copy pfmemalloc flag in __copy_skb_header()")

from the net tree and commits:

  784abe24c903 ("net: Add decrypted field to skb")
  a48d189ef531 ("net: Move skb decrypted field, avoid explicity copy")

from the net-next tree.

The conflict only occurs because a48d189ef531 didn't put the comment
back on the __unused field that was there before 784abe24c903.

I fixed it up (I used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/CXRQpIDxX.rJEPn13Ifp4Bi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltP6G4ACgkQAVBC80lX
0GyYXQf+KHuepdh2fKjGtP2B3ts1dGIoiJyMZDukUKpEt59KCiJ5Qazyv0Sif3av
ndHMEzoiZYBK5o37pYYb/uoYRWnf1WGWW/0eDFI/cjidRbY4sJRYR1jy9h+o9wEF
LFjIxrdvSKg2iRHOg7bQNUiDSNklickI1mPbZ7uAczwVod9V806zTxD1G4G9mB1f
0EyM/Qu0Y66P1k0xUrWAay2ur4gzAfmUhw2VxoErk20YpF5Ad7ZajGtG2RAf/vRy
DEI/q9iZHQGfZxLbafRZIamcvFLdwA2ivY83bZOyq3Szul8MrIEzk8VQwxiUi2lC
OrxRPXuEmh5xuCDNu1d6MivTM/ccIw==
=YhjJ
-----END PGP SIGNATURE-----

--Sig_/CXRQpIDxX.rJEPn13Ifp4Bi--
