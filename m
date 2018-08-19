From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the driver-core tree with the iommu
 tree
Date: Sun, 19 Aug 2018 10:28:27 +1000
Message-ID: <20180819102827.17365759@canb.auug.org.au>
References: <20180711131445.7e1e211b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n4misSL5e_TOxGNTvVAYa/t"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180711131445.7e1e211b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joerg Roedel <jroedel@suse.de>
Cc: Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>
List-Id: linux-next.vger.kernel.org

--Sig_/n4misSL5e_TOxGNTvVAYa/t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Jul 2018 13:14:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the driver-core tree got a conflict in:
>=20
>   drivers/iommu/ipmmu-vmsa.c
>=20
> between commits:
>=20
>   0b8ac1409641 ("iommu/ipmmu-vmsa: Hook up r8a7796 DT matching code")
>   3701c123e1c1 ("iommu/ipmmu-vmsa: Hook up r8a779(70|95) DT matching code=
")
>   98dbffd39a65 ("iommu/ipmmu-vmsa: Hook up R8A77965 DT matching code")
>=20
> from the iommu tree and commit:
>=20
>   ac6bbf0cdf42 ("iommu: Remove IOMMU_OF_DECLARE")
>=20
> from the driver-core tree.
>=20
> I fixed it up (I removed the new IOMMU_OF_DECLARE() lines) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

This is now a conflict between Linus' tree and the iommu tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/n4misSL5e_TOxGNTvVAYa/t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt4uasACgkQAVBC80lX
0Gw7jAf/cTkUZ9lWZduk2tT4O3K+bdBwo9Rw+NDkwC8kcK30GOOJRMiwn+i2+vK/
YDG59dTH/jU+dIuKs/qn6VKjGsIOG9oj1vempMzDSm2I5t2ahOmOYAoLX7hGvXH/
Qb7B2MeVy9AzeLg+eE9qUNC/8Bn/XDA7MXmJQsYZdFsJON7DSW8bCvlWVUiIGwCO
pRzdJVR1aF/50GMVnlPSx+8HVQ/c5IPnt4A/tSHeHR+J4ZrbMe1VYpejx4SgxzZk
IUMYYjS5JQwRn1U9Hkl82Hpu/hNf8ttW13k5sSLAmJX0F0U1ezdeGNTbtD6YejoF
j00+S7ObkMFZPl9dCX8YfV8NWwe+zA==
=nsZy
-----END PGP SIGNATURE-----

--Sig_/n4misSL5e_TOxGNTvVAYa/t--
