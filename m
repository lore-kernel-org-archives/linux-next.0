From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: manual merge of the mlx5-next tree with the rdma
 tree
Date: Tue, 04 Dec 2018 20:33:08 -0500
Message-ID: <a15a43d96bdbfc7201df2ea00e813fb4c0a323a1.camel@redhat.com>
References: <20181205120706.294b9422@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-ODxKlQt9+ykmbI0CeVSH"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205120706.294b9422@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--=-ODxKlQt9+ykmbI0CeVSH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW this will go away in a day or two.  I merged mlx5-next into rdma
for-next in order to take a series that depended on it.

On Wed, 2018-12-05 at 12:07 +1100, Stephen Rothwell wrote:
> Hi Leon,
>=20
> Today's linux-next merge of the mlx5-next tree got a conflict in:
>=20
>   drivers/infiniband/hw/mlx5/main.c
>   drivers/infiniband/hw/mlx5/mlx5_ib.h
>=20
> between commit:
>=20
>   36e235c88299 ("RDMA/mlx5: Use the uapi disablement APIs instead of code=
")
>=20
> from the rdma tree and commit:
>=20
>   81773ce5f07f ("RDMA/mlx5: Use stages for callback to setup and release =
DEVX")
>=20
> from the mlx5-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
--=20
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

--=-ODxKlQt9+ykmbI0CeVSH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAlwHKtQACgkQuCajMw5X
L92fpQ//T8hLm2O9WblvQt6R4t4H+uYtr2UAo/Q2GU5/riOpZ+UJKV2iYCIgvl/V
ce+wl4DxWneKjkBtCcJczlXs4oXEE37NstOGNZog/bj4h8TKuX8XQBrm28BoBFCe
5DziJigSvBJHQnXR+FPmVt8xnJ4ZAjmH93LcA5j3Mue5ua+e23YfQ8M56Lz/OM7/
mdDp3Ady7kH86tqDYJ2m4m2RFvz+pt3WzkIa7XyVTPKtogAQ0T680LsyJWvMG26c
FBtNMNbA8JswwzQJU5yoJWh7BVZSNE4GHJrID8HOmop5fkvVTW1H2YUr2sozBFtJ
yyE7qO9y9CKpiGltN7FSzuneTo0RgtXkauMh5VA4kWd3mGG6AGtugVzw4DpfVT10
x5wQHUM+367Q13ZvwI3S6y3h9aLvDsrm9Iz7JHwIUKM+IYa1Ak2JagAqAgm6aK8m
BQksWiWqDMwY5acKwe3zNSs3S7WWmBwEmLt+3bJSDEcvTe9Tn8Tt0AwNEKstLpBT
eXlXj1fGc5KjVzOHssA6Mtb1epFZQ5hN7oesqxIh6C2KSZh7jrQOfkf3XjPBiDTz
9Cc7gSeSWOXIQGWErLuDpGekzWSLsnee20u+GeitC4qH8D2yWW6gKFCM+DgOeVBe
Tku6ODcthETaxaR20iVtAlOXVUYmNN0TM6IhKh4/bGOs1nFlwWE=
=e5a9
-----END PGP SIGNATURE-----

--=-ODxKlQt9+ykmbI0CeVSH--
