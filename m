From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rdma tree
Date: Tue, 4 Dec 2018 11:47:31 +1100
Message-ID: <20181204114731.48b18bfc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xT9q_Q6rWNleqRZwtBWTjr5"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guy Levi <guyle@mellanox.com>, Majd Dibbiny <majd@mellanox.com>, Leon Romanovsky <leonro@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/xT9q_Q6rWNleqRZwtBWTjr5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rdma tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "mlx5_get_send_wqe" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefine=
d!

Caused by commit

  34f4c9554d8b ("IB/mlx5: Use fragmented QP's buffer for in-kernel users")

mlx5_get_send_wqe() is still used in drivers/infiniband/hw/mlx5/cq.c
and declared in drivers/infiniband/hw/mlx5/mlx5_ib.h ...

I have used the version of the rdma tree from next-20181203 for today.



--=20
Cheers,
Stephen Rothwell

--Sig_/xT9q_Q6rWNleqRZwtBWTjr5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwFzqMACgkQAVBC80lX
0Gx1hQf9HxgOjGsua2OpeJXMq7Ksh2/X+0k8wmmpTwilR8xwTB3cPEJrD38oeIwW
V71K2jiHKOj5manN+S7SJbqJuOyP0pXMg3MzNlrBa69TElsV2cmvJCJrHBpEsZN7
P3HJgiC5ql+vhQ5w9TpzkjwdMo1DG4Qgo7ctMF3wnioCFz3CpGdTo83qDkG2JtUZ
lHReeLBlsMPXDh5mrrHMwaBOylMJbc1zvORK5yTQz+9jxZi701MQNOXSZaGbTxdD
c/1fVGIgis41TO8SC/f1WyPG3VGilGK2GIjS/I0OGDeOSX/xBr4SPsHYCftWkVSN
aPCfUPnt5TJcK6RwlSbIm2HbBIpRAg==
=TjaF
-----END PGP SIGNATURE-----

--Sig_/xT9q_Q6rWNleqRZwtBWTjr5--
