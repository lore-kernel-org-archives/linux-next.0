From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mtd tree with Linus' tree
Date: Tue, 29 Jan 2019 11:17:00 +1100
Message-ID: <20190129111700.7d50e369@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/V3DFixBTCDCpDgE5gzqtXFn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: linux-next.vger.kernel.org

--Sig_/V3DFixBTCDCpDgE5gzqtXFn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mtd tree got a conflict in:

  drivers/mtd/mtdpart.c

between commit:

  2b6f0090a333 ("mtd: Check add_mtd_device() ret code")

from Linus' tree and commit:

  2c24c9af0f38 ("mtd: rework partitions handling")

from the mtd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/mtd/mtdpart.c
index 60104e1079c5,089095b3c50d..000000000000
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@@ -610,30 -265,18 +265,30 @@@ int mtd_add_partition(struct mtd_info *
  	part.size =3D length;
  	part.offset =3D offset;
 =20
- 	new =3D allocate_partition(parent, &part, -1, offset);
- 	if (IS_ERR(new))
- 		return PTR_ERR(new);
+ 	child =3D allocate_partition(parent, &part, -1, offset);
+ 	if (IS_ERR(child))
+ 		return PTR_ERR(child);
 =20
- 	mutex_lock(&mtd_partitions_mutex);
- 	list_add(&new->list, &mtd_partitions);
- 	mutex_unlock(&mtd_partitions_mutex);
+ 	mutex_lock(&master->props.master.partitions_lock);
+ 	list_add_tail(&child->props.part.node, &parent->partitions);
+ 	mutex_unlock(&master->props.master.partitions_lock);
 =20
- 	ret =3D add_mtd_device(&new->mtd);
 -	add_mtd_device(child);
++	ret =3D add_mtd_device(child);
 +	if (ret)
 +		goto err_remove_part;
 =20
- 	mtd_add_partition_attrs(new);
+ 	mtd_add_partition_attrs(child);
 =20
 +	return 0;
 +
 +err_remove_part:
- 	mutex_lock(&mtd_partitions_mutex);
- 	list_del(&new->list);
- 	mutex_unlock(&mtd_partitions_mutex);
++	mutex_lock(&master->props.master.partitions_lock);
++	list_del(&child->props.part.node);
++	mutex_unlock(&master->props.master.partitions_lock);
 +
- 	free_partition(new);
++	free_partition(child);
 +	pr_info("%s:%i\n", __func__, __LINE__);
 +
  	return ret;
  }
  EXPORT_SYMBOL_GPL(mtd_add_partition);
@@@ -722,46 -386,33 +398,47 @@@ int add_mtd_partitions(struct mtd_info=20
  		       const struct mtd_partition *parts,
  		       int nbparts)
  {
- 	struct mtd_part *slave;
+ 	struct mtd_info *child, *master =3D mtd_get_master(parent);
  	uint64_t cur_offset =3D 0;
 -	int i;
 +	int i, ret;
 =20
- 	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, m=
aster->name);
+ 	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n",
+ 	       nbparts, parent->name);
 =20
  	for (i =3D 0; i < nbparts; i++) {
- 		slave =3D allocate_partition(master, parts + i, i, cur_offset);
- 		if (IS_ERR(slave)) {
- 			ret =3D PTR_ERR(slave);
+ 		child =3D allocate_partition(parent, parts + i, i, cur_offset);
+ 		if (IS_ERR(child)) {
 -			del_mtd_partitions(parent);
 -			return PTR_ERR(child);
++			ret =3D PTR_ERR(child);
 +			goto err_del_partitions;
  		}
 =20
- 		mutex_lock(&mtd_partitions_mutex);
- 		list_add(&slave->list, &mtd_partitions);
- 		mutex_unlock(&mtd_partitions_mutex);
+ 		mutex_lock(&master->props.master.partitions_lock);
+ 		list_add_tail(&child->props.part.node, &parent->partitions);
+ 		mutex_unlock(&master->props.master.partitions_lock);
 =20
 -		add_mtd_device(child);
 +		ret =3D add_mtd_device(child);
 +		if (ret) {
- 			mutex_lock(&mtd_partitions_mutex);
- 			list_del(&slave->list);
- 			mutex_unlock(&mtd_partitions_mutex);
++			mutex_lock(&master->props.master.partitions_lock);
++			list_del(&child->props.part.node);
++			mutex_unlock(&master->props.master.partitions_lock);
 +
- 			free_partition(slave);
++			free_partition(child);
 +			goto err_del_partitions;
 +		}
 +
- 		mtd_add_partition_attrs(slave);
+ 		mtd_add_partition_attrs(child);
  		/* Look for subpartitions */
- 		parse_mtd_partitions(&slave->mtd, parts[i].types, NULL);
+ 		parse_mtd_partitions(child, parts[i].types, NULL);
 =20
- 		cur_offset =3D slave->offset + slave->mtd.size;
+ 		cur_offset =3D child->props.part.offset + child->size;
  	}
 =20
  	return 0;
 +
 +err_del_partitions:
- 	del_mtd_partitions(master);
++	del_mtd_partitions(parent);
 +
 +	return ret;
  }
 =20
  static DEFINE_SPINLOCK(part_parser_lock);

--Sig_/V3DFixBTCDCpDgE5gzqtXFn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxPm3wACgkQAVBC80lX
0GwvRQf/W9lL+KMNOwYrIemfRN8/Jqjc4gQYTDlTy5MW7mjtIdaG3er5yn2XV6Hi
d+qWUBXLPcdI7GzZP7ENF3SwgeeDKykg0jbHLNHzmKrljvT18njB+GdUcdtMgQll
hvgfRPSMv6uDaSiP9d9j8l/hzg+vPL4QB+vjY1oFGwIxaPwQUXmAw9wHIUGkM3iL
g1a8t7Dj4ZeBKQ2BtuaEBHHrKQ06Yu6WcriUjVvQvTDq9+rwummuWW0HdUbHHKrp
8ijDG391+Ud52T4gQNCDsaiMHJ01KQ6pI1FCdJJ7v4PCIVGEw2x9QWDbr3KlzUHK
s+OO6uxm1mLUkx7qaBIdof+0kYcQwA==
=9ZCY
-----END PGP SIGNATURE-----

--Sig_/V3DFixBTCDCpDgE5gzqtXFn--
