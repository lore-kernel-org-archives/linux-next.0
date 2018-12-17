From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with the net tree
Date: Mon, 17 Dec 2018 11:08:10 +1100
Message-ID: <20181217110810.64c69fb7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1zq4QKW_k7lZNhobxfgsABJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vu Pham <vu@mellanox.com>, Gal Pressman <pressmangal@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/1zq4QKW_k7lZNhobxfgsABJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  include/linux/mlx5/mlx5_ifc.h

between commit:

  663f146f2ecf ("net/mlx5: E-Switch, Fix fdb cap bits swap")

from the net tree and commit:

  c74d90c11c05 ("net/mlx5: Fix offsets of ifc reserved fields")

from the rdma tree.

I fixed it up (I just used the net tree version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/1zq4QKW_k7lZNhobxfgsABJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwW6OoACgkQAVBC80lX
0Gw/swf/d/04P60KdIOunQvtylL1V3DmxsWUxaiQ2U75eV+9LwDVZROrDgCxT9Hz
KwjN1Nb2G8unM9s7lExVolkr/mrgWcalYo5QaDxpACEv15G1rDCwg9wUgQ8UPwWG
Wp/MVTsT8DyGGOd5x8JjmbXANC731SGA3EjzgVhOfTvKgXc6FaBpAKgNcwB6i29f
HVFM7be/JAu0oxRA/2leOZe2lChxdREoHlPE/ek8Q0ylYB+LCT6vI72PESnGnBtY
kdi6hErmOE8FHik2XN9CHjZmi/DKsY7pdxoYhEJSRJ0YfrvuAadY6ZutrnTb/8W2
1JZUba2gLH109jqOfmo+M1cBPGizUQ==
=1cch
-----END PGP SIGNATURE-----

--Sig_/1zq4QKW_k7lZNhobxfgsABJ--
