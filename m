From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Fri, 28 Sep 2018 10:01:25 +1000
Message-ID: <20180928100125.61d3e9b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/H7eBr65DM_xMh3ydIUsjR_Y"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Parav Pandit <parav@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/H7eBr65DM_xMh3ydIUsjR_Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/core/cache.c

between commit:

  5c5702e259dc ("RDMA/core: Set right entry state before releasing referenc=
e")

from Linus' tree and commit:

  43c7c851b9bc ("RDMA/core: Use dev_err/dbg/etc instead of pr_* + ibdev->na=
me")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/core/cache.c
index 3208ad6ad540,ebc64418d809..000000000000
--- a/drivers/infiniband/core/cache.c
+++ b/drivers/infiniband/core/cache.c
@@@ -337,39 -335,6 +335,38 @@@ static int add_roce_gid(struct ib_gid_t
  	return 0;
  }
 =20
 +/**
 + * del_gid - Delete GID table entry
 + *
 + * @ib_dev:	IB device whose GID entry to be deleted
 + * @port:	Port number of the IB device
 + * @table:	GID table of the IB device for a port
 + * @ix:		GID entry index to delete
 + *
 + */
 +static void del_gid(struct ib_device *ib_dev, u8 port,
 +		    struct ib_gid_table *table, int ix)
 +{
 +	struct ib_gid_table_entry *entry;
 +
 +	lockdep_assert_held(&table->lock);
 +
- 	pr_debug("%s device=3D%s port=3D%d index=3D%d gid %pI6\n", __func__,
- 		 ib_dev->name, port, ix,
- 		 table->data_vec[ix]->attr.gid.raw);
++	dev_dbg(&ib_dev->dev, "%s port=3D%d index=3D%d gid %pI6\n", __func__, po=
rt,
++		ix, table->data_vec[ix]->attr.gid.raw);
 +
 +	write_lock_irq(&table->rwlock);
 +	entry =3D table->data_vec[ix];
 +	entry->state =3D GID_TABLE_ENTRY_PENDING_DEL;
 +	/*
 +	 * For non RoCE protocol, GID entry slot is ready to use.
 +	 */
 +	if (!rdma_protocol_roce(ib_dev, port))
 +		table->data_vec[ix] =3D NULL;
 +	write_unlock_irq(&table->rwlock);
 +
 +	put_gid_entry_locked(entry);
 +}
 +
  /**
   * add_modify_gid - Add or modify GID table entry
   *

--Sig_/H7eBr65DM_xMh3ydIUsjR_Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlutb1UACgkQAVBC80lX
0Gyh+QgAiWrgB9Q4RxX4q4SK3g+9/UzHcT/wXrHxYpfxKzTPRRAl8BMp+IeRtXI8
3MrQtx94DaVl6nYhT1b4VLKxf0dZaQrivI3Rbfw4IpeR2WfCs6mwK5KVEBoCFlMr
O+2ErFkqX+KP5zX0VYd/K8fSey8pu/kteiZmIZBTDfE8gwf0RNSzy+QsqdRghx0q
+WLaiKUQPXE+T+JYqNSqxEVivM0+JP3QIY85TDkizRCXteW3WGNw5kFmlWJ5HtbA
FnUq18k0O1osoTCSh3/Qywu1GfFAIOkPTOp6BVnODS6qB5ArNvwFBFoxLQgJTvMV
QGuXa+rt7+lqbNN4aDd/Pn2lyPPjmA==
=ba80
-----END PGP SIGNATURE-----

--Sig_/H7eBr65DM_xMh3ydIUsjR_Y--
