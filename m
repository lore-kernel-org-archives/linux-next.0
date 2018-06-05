From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the nvdimm tree with the jc_docs
 tree
Date: Tue, 5 Jun 2018 11:20:42 +1000
Message-ID: <20180605112042.54e7c30b@canb.auug.org.au>
References: <20180509180539.57a360e7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UGmytnCoi_R9vRLCVZW4Bsg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180509180539.57a360e7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/UGmytnCoi_R9vRLCVZW4Bsg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 9 May 2018 18:05:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the nvdimm tree got a conflict in:
>=20
>   mm/hmm.c
>=20
> between commit:
>=20
>   ad56b738c5dd ("docs/vm: rename documentation files to .rst")
>=20
> from the jc_docs tree and commit:
>=20
>   737b47a6db70 ("mm, dev_pagemap: introduce CONFIG_DEV_PAGEMAP_OPS")
>=20
> from the nvdimm tree.
>=20
> I fixed it up (the latter removed the comment modified by the former,
> so I just did that) and can carry the fix as necessary. This is now
> fixed as far as linux-next is concerned, but any non trivial conflicts
> should be mentioned to your upstream maintainer when your tree is
> submitted for merging. You may also want to consider cooperating with
> the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This is now a conflict between the nvdimm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/UGmytnCoi_R9vRLCVZW4Bsg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsV5WoACgkQAVBC80lX
0Gw6Sgf/dVlFiCI5OZAkqmBPxO9x7GDJRL3Nknl6UL3shpM4oSZxjXhvkNDjZf+t
9ok7gUq0E93W2fp7ON26+mSpfH2GStdlaHSJoVDzQwbzjmIi1BWm4FK8tWU3HoGJ
OIalPoiax/RaLQr6hNzdhAQJTM2046x5SKFA0C/XolQXRkUcJloJb40QZArUq4yu
NnJQdIIUs09oFfP6zb6VhNFFR2PEBGu5miX0Fs/02WG7Q8uxBMrNQSfdrnE0MoOt
iYhs7p+uJEfHf8qzBf3Xpy7Rgr3M2XL1YsOEZ0bX6+j+V8UNxwkn1pkTFnwFAmcf
Z+T6FjVHySkar6J2gwAoC0130RkcEw==
=Hy4y
-----END PGP SIGNATURE-----

--Sig_/UGmytnCoi_R9vRLCVZW4Bsg--
