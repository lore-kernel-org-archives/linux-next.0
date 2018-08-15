From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the net-next tree with the rdma
 tree
Date: Thu, 16 Aug 2018 09:45:51 +1000
Message-ID: <20180816094551.7854fd4d@canb.auug.org.au>
References: <20180802120503.7b7e116f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zQy04OotBTucOsu16=5PMgH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802120503.7b7e116f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org

--Sig_/zQy04OotBTucOsu16=5PMgH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 2 Aug 2018 12:05:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   net/rds/ib_send.c
>=20
> between commit:
>=20
>   d34ac5cd3a73 ("RDMA, core and ULPs: Declare ib_post_send() and ib_post_=
recv() arguments const")
>=20
> from the rdma tree and commit:
>=20
>   87f70132b08e ("rds: remove redundant variable 'rds_ibdev'")
>=20
> from the net-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc net/rds/ib_send.c
> index 8ac80c1b051e,c8dd3125d398..000000000000
> --- a/net/rds/ib_send.c
> +++ b/net/rds/ib_send.c
> @@@ -758,8 -758,7 +758,7 @@@ int rds_ib_xmit_atomic(struct rds_conne
>   {
>   	struct rds_ib_connection *ic =3D conn->c_transport_data;
>   	struct rds_ib_send_work *send =3D NULL;
>  -	struct ib_send_wr *failed_wr;
>  +	const struct ib_send_wr *failed_wr;
> - 	struct rds_ib_device *rds_ibdev;
>   	u32 pos;
>   	u32 work_alloc;
>   	int ret;

This is now a conflict between Linux' tree and the rdma tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/zQy04OotBTucOsu16=5PMgH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt0uy8ACgkQAVBC80lX
0GxFJQf9GrbW3g80f43zneyJAxEJSqEJw8U78QaHE0FZj54eUFzQb4zn2dpqNDiX
+gZevngvMnNORkcoYYepU/TBzxOK4AZxvanTe2snEcqkdwtDlnIOjG4l3XzGwq74
43bBhxN/yF/j0t6XdZHVUoBRSaWqF02CESdLKKCsgiQW9hjd7DSqVp7JvzHfruvE
m6e0rT9ymyn9rMCDodwHco4kQAt3lmK3xoHNAiugqB9t0kzEa+l5YhOV3YsMOTxW
9caDqffkyaIObwNJn+buXGC/F+/ttEpz6wiAzHkd74hMyUtfADIDZ2E4ecJifBwZ
BVKBqgukyacTM6ArzgW3qs/sL5KY9g==
=psXN
-----END PGP SIGNATURE-----

--Sig_/zQy04OotBTucOsu16=5PMgH--
