From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: manual merge of the rdma tree with the rdma-fixes
 tree
Date: Mon, 30 Apr 2018 20:55:35 -0400
Message-ID: <1525136135.11756.94.camel@redhat.com>
References: <20180501101017.517b38af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-I9SppQfX8HkOfcQA5L16"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180501101017.517b38af@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhu Yanjun <yanjun.zhu@oracle.com>
List-Id: linux-next.vger.kernel.org


--=-I9SppQfX8HkOfcQA5L16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-05-01 at 10:10 +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the rdma tree got a conflict in:
>=20
>   drivers/infiniband/sw/rxe/rxe_resp.c
>=20
> between commit:
>=20
>   9fd4350ba895 ("B/rxe: avoid double kfree_skb")
>=20
> from the rdma-fixes tree and commit:
>=20
>   2e47350789eb ("IB/rxe: optimize the function duplicate_request")
>=20
> from the rdma tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20

We will probably merge the for-rc branch into the for-next branch in the
next few days, at which point we will do the conflict resolution
ourselves and your need to carry anything should drop out.

--=20
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD
--=-I9SppQfX8HkOfcQA5L16
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAlrnuwcACgkQuCajMw5X
L93OIhAAmYPokQ6hbId+nYkcCLSfK7EG/hfwXDARB4AQV44pcZEPa0yo5DclvIj4
j6dHtDl9EZZSrfT7KTB9a/4M+uXVjdUVyyf5fPuABj7axCn43DkIaOftfixzKfUq
zw/Lm3zb1wD7FXwpT2o++x2uZtkZ58T2zbvKDAmEG6g7ntLPMts4+ZNaFVr0MiEk
Jl7eXoigIVEJfWXU72o/fSWhbZiXvWGLD4Iuoht8KAzL/r+x74cObBscoGRNoiPr
KEc5SNfES7zG76fJfSaIYcDzsC3td5R/+mB5ljSMLQQpM/BZ2/OphO7Iz8HeAaAn
VnEIVfPF+TkLNjkzmDP2wfurRzC7A+aPCovemiWTecIqccTwfgDM3zeF/vLM/TzT
vDWRYCiQ/aricZA48OloeEyDMjKC1vkpIKMdqOzuS/dbBUMJl5wzNgI3FG6UAIkx
k6SPKWx3U1/5dThvRPpZiTT8UEQBVe1zPEaFGAccjpqmnRFvd9zI8VcewtHTbZkr
2BB4YQDxHq7LScVgXZ8QKu+5yfHOiz0w0B+cIolHlEj9yDbB1+KxrdujVLpJV/b4
IPOAdvM7KSMRvWKkDKe3ftvjPMUajp1LwuYWdID7zMIFRZY99wuFxSxR4MFBVidr
n8IByKlxZowW57A5PmbZYxLUVYfLdAsZFMWYc+H/qU9Ukg/F3tg=
=ES9A
-----END PGP SIGNATURE-----

--=-I9SppQfX8HkOfcQA5L16--
