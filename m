From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the rdma tree
Date: Thu, 2 Aug 2018 12:05:03 +1000
Message-ID: <20180802120503.7b7e116f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fsXgdrzl56NJq_q07LgxuFO"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org

--Sig_/fsXgdrzl56NJq_q07LgxuFO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/rds/ib_send.c

between commit:

  d34ac5cd3a73 ("RDMA, core and ULPs: Declare ib_post_send() and ib_post_re=
cv() arguments const")

from the rdma tree and commit:

  87f70132b08e ("rds: remove redundant variable 'rds_ibdev'")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/rds/ib_send.c
index 8ac80c1b051e,c8dd3125d398..000000000000
--- a/net/rds/ib_send.c
+++ b/net/rds/ib_send.c
@@@ -758,8 -758,7 +758,7 @@@ int rds_ib_xmit_atomic(struct rds_conne
  {
  	struct rds_ib_connection *ic =3D conn->c_transport_data;
  	struct rds_ib_send_work *send =3D NULL;
 -	struct ib_send_wr *failed_wr;
 +	const struct ib_send_wr *failed_wr;
- 	struct rds_ib_device *rds_ibdev;
  	u32 pos;
  	u32 work_alloc;
  	int ret;

--Sig_/fsXgdrzl56NJq_q07LgxuFO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltiZs8ACgkQAVBC80lX
0GzfcggAl3p9lIPkl54CfgTX65bIKbypibZIn0hBprPcjZfcbuZhmCpFcXuL4ZC8
3m2N111XId66ttxwttmVdF2SEzhy0PfNiQsWMwa4rlS5nIlze0Sn00XQ9bD6A2xC
6RYSgRs8D7yKyiglaIr2OVZrc/LnaOT+Ft8VzDf7SfVpZX+OGm0Vpp5UQYbotbe+
uuiIN/mneecMulHfuC3p4MP8tsirQnWo3HhMeC2UGSPaosw3W8AZO4+AFmobfOyl
xB4hBwsbt/nl+bH7J98z3jpOVH1brhqpkY1plKV1AZ+yXyb7K3e1A0u4aRtbGspA
HFCChy+ry31mrjHiRV3IGMS4DgWbsQ==
=UJDA
-----END PGP SIGNATURE-----

--Sig_/fsXgdrzl56NJq_q07LgxuFO--
