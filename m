From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the rdma tree
Date: Wed, 27 Feb 2019 11:25:22 +1100
Message-ID: <20190227112522.2f32b5d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/61E+E=v=M=v7ar4TF936D8O"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shamir Rabinovitch <shamir.rabinovitch@oracle.com>, Jakub Kicinski <jakub.kicinski@netronome.com>
List-Id: linux-next.vger.kernel.org

--Sig_/61E+E=v=M=v7ar4TF936D8O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/infiniband/hw/mlx4/Kconfig

between commit:

  6fa8f1afd337 ("IB/{core,uverbs}: Move ib_umem_xxx functions from ib_core =
to ib_uverbs")

from the rdma tree and commit:

  f4b6bcc7002f ("net: devlink: turn devlink into a built-in")

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

diff --cc drivers/infiniband/hw/mlx4/Kconfig
index db4aa13ebae0,4e9936731867..000000000000
--- a/drivers/infiniband/hw/mlx4/Kconfig
+++ b/drivers/infiniband/hw/mlx4/Kconfig
@@@ -1,7 -1,7 +1,6 @@@
  config MLX4_INFINIBAND
  	tristate "Mellanox ConnectX HCA support"
  	depends on NETDEVICES && ETHERNET && PCI && INET
- 	depends on MAY_USE_DEVLINK
 -	depends on INFINIBAND_USER_ACCESS || !INFINIBAND_USER_ACCESS
  	select NET_VENDOR_MELLANOX
  	select MLX4_CORE
  	---help---

--Sig_/61E+E=v=M=v7ar4TF936D8O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx12PIACgkQAVBC80lX
0GwydAf/f5cBV+Q5Mk8KlUIarqwXrGwbQBHcqEbqNWDb135JeKDx16nJAua05vS9
F+f9WKYZHVqN0ZOtM8QGbEHJJnad+MeJJxgdZkazTHPmAn+uR/jXNvhUsfHNfsiC
3iiCCFxk2+kdzx0Dagp53huNFg7hRmJCIrFNh1Rff+Nt/f16mcFR6vrSE2QyaznH
caMhE6dl4wDAQMcloViKatxUtvTdsbRDBRmb9Q9MErY80V1UC8SISy4RAt8okx1A
ahEvzpgRiYpP/t2RMvBQ8yNVJnQ663slbYPZIGMEBApCI1aa4mX7PxC7vzeLBMMr
NTazxzxhYP+AmhYgrMt4utiGapsBhA==
=78aA
-----END PGP SIGNATURE-----

--Sig_/61E+E=v=M=v7ar4TF936D8O--
