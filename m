From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the staging tree with the crypto
 tree
Date: Thu, 16 Aug 2018 09:49:03 +1000
Message-ID: <20180816094903.7744e6b0@canb.auug.org.au>
References: <20180709141510.19e1a851@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/upyty1xtbrJvU==k2faYGk4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180709141510.19e1a851@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@google.com>, Jason Cooper <jason@lakedaemon.net>
List-Id: linux-next.vger.kernel.org

--Sig_/upyty1xtbrJvU==k2faYGk4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 9 Jul 2018 14:15:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the staging tree got a conflict in:
>=20
>   drivers/staging/skein/skein_generic.c
>=20
> between commit:
>=20
>   e50944e219f9 ("crypto: shash - remove useless setting of type flags")
>=20
> from the crypto tree and commit:
>=20
>   ee55fe552fcd ("staging/skein: Remove Skein and Threefish code")
>=20
> from the staging tree.
>=20
> I fixed it up (I removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between Linus' tree and the staging tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/upyty1xtbrJvU==k2faYGk4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt0u+8ACgkQAVBC80lX
0Gy7xgf+Pu959NmJH1jaCFZHTYPqC4ac/D+oqPNzZw88GtrLEy4jKUTF55m4ksms
vO+xA5s5ET86Dqkqh5OP9nIGMoHb3r7RxRmxt/dvdjQpF5vfN8xJCifCPd0+WkEg
XOPETR/+FkeXhv8TjHtTSfGP4jsSU2xVJmcZdok9xhn2kKtlthWEqJK3i5Af3yvV
y9Frv+k0T3NOPkLwbP4TG1HFuMua2B0v3NzeenjwXTcGT/fZ4POC5+/9qfSGQrb7
OJ3CgcgC7imhY08zKVUjSR+EIeB5rZP7YGgIe5uWAbnD1kSO6vJ6X/YQZog4Y72L
IFy75ug07I4tL9ZkZaWLyfMEV997HQ==
=27hh
-----END PGP SIGNATURE-----

--Sig_/upyty1xtbrJvU==k2faYGk4--
