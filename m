From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ubifs tree with Linus' tree
Date: Wed, 8 May 2019 10:05:25 +1000
Message-ID: <20190508100525.7c24c8be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PktYFn.tjcmLyihpLR/OTUn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@google.com>, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>
List-Id: linux-next.vger.kernel.org

--Sig_/PktYFn.tjcmLyihpLR/OTUn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ubifs tree got a conflict in:

  fs/ubifs/auth.c

between commit:

  877b5691f27a ("crypto: shash - remove shash_desc::flags")

from Linus' tree and commit:

  f4844b35d68a ("ubifs: work around high stack usage with clang")

from the ubifs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/ubifs/auth.c
index b758004085c4,3d049194afa4..000000000000
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@@ -85,12 -86,17 +84,16 @@@ int ubifs_prepare_auth_node(struct ubif
  	if (!hash)
  		return -ENOMEM;
 =20
- 	hash_desc->tfm =3D c->hash_tfm;
- 	ubifs_shash_copy_state(c, inhash, hash_desc);
+ 	{
+ 		SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
 =20
- 	err =3D crypto_shash_final(hash_desc, hash);
- 	if (err)
- 		goto out;
+ 		hash_desc->tfm =3D c->hash_tfm;
 -		hash_desc->flags =3D CRYPTO_TFM_REQ_MAY_SLEEP;
+ 		ubifs_shash_copy_state(c, inhash, hash_desc);
+=20
+ 		err =3D crypto_shash_final(hash_desc, hash);
+ 		if (err)
+ 			goto out;
+ 	}
 =20
  	err =3D ubifs_hash_calc_hmac(c, hash, auth->hmac);
  	if (err)

--Sig_/PktYFn.tjcmLyihpLR/OTUn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzSHUUACgkQAVBC80lX
0GxluAf+NFIDpqdiuZljF+G24ADeJLFbGjsnyLnKHvfZwi0xS/hCVrzhpL0NnyUo
ZtExq/OwLbnb0/BNgG5C1WlnhGrpfDE62f81N8cajNl5fuYmBsQW+9zBiokJM63J
tiWJ9Y2cwN4WAp15sQUogprh4dXOwp/dwer+Q47GvX6KOZHdXByGEjQLYBlqafg1
6a8xoIbjxmCi06vqcu3EiuF9g0PICRMPrbpTpDAPcaKFvJyXFVTFHY35dctILcQq
2QzqLIWLfQuE+DJedxdOPf/f29ofZls4Z46JihojydTUUMwymC4ANWBofzct9nWB
j+UuwyN5M5Q5+Q9pkJN496Xx/gI02g==
=gYRA
-----END PGP SIGNATURE-----

--Sig_/PktYFn.tjcmLyihpLR/OTUn--
