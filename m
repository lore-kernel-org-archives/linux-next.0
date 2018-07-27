From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the rdma tree
Date: Fri, 27 Jul 2018 12:33:01 +1000
Message-ID: <20180727123301.3ac97ddc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/obtSygckK1wuZX/oWMFIP+z"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Parav Pandit <parav@mellanox.com>, Ursula Braun <ubraun@linux.ibm.com>, Leon Romanovsky <leonro@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/obtSygckK1wuZX/oWMFIP+z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got conflicts in:

  net/smc/smc_core.c
  net/smc/smc_ib.c

between commit:

  ddb457c6993b ("net/smc: Replace ib_query_gid with rdma_get_gid_attr")

from the rdma tree and commit:

  7005ada68d17 ("net/smc: use correct vlan gid of RoCE device")
(and maybe others)

from the net-next tree.

I fixed it up (I wasn't sure how to fix this up as so much has changed
in the net-next tree and both modified functions had been (re)moved,
so I effectively reverted the rdma tree commit) and can carry the fix
as necessary.  Please come to some arrangement about this.

--=20
Cheers,
Stephen Rothwell

--Sig_/obtSygckK1wuZX/oWMFIP+z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltahF0ACgkQAVBC80lX
0GwnXQf/Y+fXHWI6aGm6LUXQeoHVB++6qxfQuMtudcwQdCr6FSm7nFWpXsS31G3/
ONe5F4QH0aFtFfrsV9iuxhmT0h4yAe7PN4uR64Kr2+wmffcPuMPgOQiJX1IfFsOo
hIHwatLR6HyFS0SLMnpEWD0MpUcU8pf+t/LPE7kbnXyNlbmKswIBz7qWGDA0ucau
ogafC8tOc+Zu4XKy1Y0azDjBPSqhSAk/qZ8mAjJv+EaCFUxfQ0ri0OuVo6vJ/YX4
/vXwYAxAKMkQH4l1+xHZ67WRb+oh0kJzGfPhXynvANAn4EeiCNjMWIcZnl5hHhe5
iaY3HPgtXrp3CxpRjmWKCj4R6joR7g==
=WdDR
-----END PGP SIGNATURE-----

--Sig_/obtSygckK1wuZX/oWMFIP+z--
