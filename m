From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the crypto tree
Date: Thu, 15 Mar 2018 17:58:41 +1100
Message-ID: <20180315175841.5c3de18d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/K52V4NaoQ0ltlVX35WfriE3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gilad Ben-Yossef <gilad@benyossef.com>
List-Id: linux-next.vger.kernel.org

--Sig_/K52V4NaoQ0ltlVX35WfriE3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/ccree/Kconfig
  drivers/staging/ccree/Makefile

between commit:

  e294ca1cca3a ("staging: ccree: rename staging ver and mark as broken")

from the crypto tree and commit:

  8b0217965418 ("staging: ccree: remove ccree staging driver copy")

from the staging tree.

I fixed it up (I just removed the files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/K52V4NaoQ0ltlVX35WfriE3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqqGaEACgkQAVBC80lX
0GyX0wf/YOb5rCX8ND3YA+qaCuEpZ8bdjwBni/eYAeCv3v5CVjbmxTBnrETZALRh
2jgadtl2p6VcWZWchHRaiQXeu30+t4GO1GhKkS6hDPtEHaudP0ucS2jnzp38xZhe
JCx5P6YYcS6kFqUcISIxA6Rd+ab+s19uLAx/Ft9p/OMxdkZkTeUlGzeNSgzJR6eI
3u7E8/MmHRruyxbmzWTu+J55toJAFm9DwNcA6LmBLeSoIYFZ4V+GKJQz/tl5i1og
evdy8wRf1Jg6OJteiYyCFC1vG7tkwqxPhlsCtGwRuJmP35aGNpdAM2QXZRYLpo89
AMO7nowe7gx+PjgXzRIZrPIZPEe+Qw==
=6k7/
-----END PGP SIGNATURE-----

--Sig_/K52V4NaoQ0ltlVX35WfriE3--
