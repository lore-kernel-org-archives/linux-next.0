From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rdma tree with the nfs-anna
 tree
Date: Sun, 30 Dec 2018 12:48:47 +1100
Message-ID: <20181230124847.09855735@canb.auug.org.au>
References: <20181224141352.461303be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fQ9swKvDDvNOmfMtlkvAh+5"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181224141352.461303be@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, NFS Mailing List <linux-nfs@vger.kernel.org>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Kamal Heib <kamalheib1@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/fQ9swKvDDvNOmfMtlkvAh+5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 24 Dec 2018 14:13:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rdma tree got a conflict in:
>=20
>   net/sunrpc/xprtrdma/fmr_ops.c
>=20
> between commit:
>=20
>   d31f8deac38d ("xprtrdma: Remove support for FMR memory registration")
>=20
> from the nfs-anna tree and commit:
>=20
>   3023a1e93656 ("RDMA: Start use ib_device_ops")
>=20
> from the rdma tree.
>=20
> I fixed it up (the former removed the file, so I did that) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

This is now a conflict between the nfs-anna tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/fQ9swKvDDvNOmfMtlkvAh+5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwoI/8ACgkQAVBC80lX
0Gx8zQf+PzBOOkT2I/QlmiFm9z3e6K7yj8ceByWoFSm2Vk7ETUqyErykrrI3ZiRR
XUlbmBiZXSgJomzSvYDH6Yw7nsr21cdr/Hmv87b9A4JK6CRmyzmCNO3p2/cZm2at
S4V54mQotkVBlnXZroEiWEhZa9XZdJubVx0Mfq/2oDieD7CDqF4YqZeQC4q2V7Gw
KeEOhqbzPVs191wX3/md7TOZjZ+Raeqhnz0PFZYoLF8wo9UH6LjNUu2e2mWqj06A
G7NnWydZGJtWNB+GVOMfzKnmJmr3SagST6bNJgpLHRCx/7ilsdf8y9H7Y5oytOzU
EWI8wFYnS0LAsFzdBS7zit6Q07AMiQ==
=D89L
-----END PGP SIGNATURE-----

--Sig_/fQ9swKvDDvNOmfMtlkvAh+5--
