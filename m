From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the crypto tree
Date: Mon, 9 Jul 2018 14:15:10 +1000
Message-ID: <20180709141510.19e1a851@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/a5JKtwXSHbpLfl+t1FN4Fvh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@google.com>, Jason Cooper <jason@lakedaemon.net>
List-Id: linux-next.vger.kernel.org

--Sig_/a5JKtwXSHbpLfl+t1FN4Fvh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/skein/skein_generic.c

between commit:

  e50944e219f9 ("crypto: shash - remove useless setting of type flags")

from the crypto tree and commit:

  ee55fe552fcd ("staging/skein: Remove Skein and Threefish code")

from the staging tree.

I fixed it up (I removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/a5JKtwXSHbpLfl+t1FN4Fvh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltC4U4ACgkQAVBC80lX
0GyBIAf9EfZfypf3LmgP+OhGy+jbSkJ2kAiLOC2/x7hkoFIHmH8o0b1GNIc5lT/5
Uc26sD5jwq92sSQgloIPuOOAsl+z0enRaGKu2M30yAc+YnBAJCJfS33N8VAGS8IU
6UCasRaA9+2OFDT1iowbgdZ0tTOCY/V3OPzc71g3PdA5zO9/CX/IRbNWBUEBB5ZK
RdFLxRgRI+3JTeg+RMD9Ssp+FaCkjxmeG2Yqlmil/OVzV+TqMvZaO5RQk1WxLk2F
Vy/m6wb11uFF20HwPcMf00wXDiU3iYcClcD4pfzpfp7Ud4yig4iHIRzWzeHrw//h
68rWRyYudjCtgWpPcCLx8mRs04tpQw==
=PbV7
-----END PGP SIGNATURE-----

--Sig_/a5JKtwXSHbpLfl+t1FN4Fvh--
