From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 10 Dec 2018 12:31:07 +1100
Message-ID: <20181210123107.5bd896b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/v53H/qMN_qycCS0ws_ZtPnn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/v53H/qMN_qycCS0ws_ZtPnn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/dsa/master.c

between commit:

  a3d7e01da060 ("net: dsa: Fix tagging attribute location")

from the net tree and commits:

  a60956ed72f7 ("net: dsa: Make dsa_master_set_mtu() static")

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

diff --cc net/dsa/master.c
index 5e8c9bef78bd,d7d5145aa235..000000000000
--- a/net/dsa/master.c
+++ b/net/dsa/master.c
@@@ -158,31 -158,36 +158,59 @@@ static void dsa_master_ethtool_teardown
  	cpu_dp->orig_ethtool_ops =3D NULL;
  }
 =20
 +static ssize_t tagging_show(struct device *d, struct device_attribute *at=
tr,
 +			    char *buf)
 +{
 +	struct net_device *dev =3D to_net_dev(d);
 +	struct dsa_port *cpu_dp =3D dev->dsa_ptr;
 +
 +	return sprintf(buf, "%s\n",
 +		       dsa_tag_protocol_to_str(cpu_dp->tag_ops));
 +}
 +static DEVICE_ATTR_RO(tagging);
 +
 +static struct attribute *dsa_slave_attrs[] =3D {
 +	&dev_attr_tagging.attr,
 +	NULL
 +};
 +
 +static const struct attribute_group dsa_group =3D {
 +	.name	=3D "dsa",
 +	.attrs	=3D dsa_slave_attrs,
 +};
 +
+ static void dsa_master_set_mtu(struct net_device *dev, struct dsa_port *c=
pu_dp)
+ {
+ 	unsigned int mtu =3D ETH_DATA_LEN + cpu_dp->tag_ops->overhead;
+ 	int err;
+=20
+ 	rtnl_lock();
+ 	if (mtu <=3D dev->max_mtu) {
+ 		err =3D dev_set_mtu(dev, mtu);
+ 		if (err)
+ 			netdev_dbg(dev, "Unable to set MTU to include for DSA overheads\n");
+ 	}
+ 	rtnl_unlock();
+ }
+=20
+ static void dsa_master_reset_mtu(struct net_device *dev)
+ {
+ 	int err;
+=20
+ 	rtnl_lock();
+ 	err =3D dev_set_mtu(dev, ETH_DATA_LEN);
+ 	if (err)
+ 		netdev_dbg(dev,
+ 			   "Unable to reset MTU to exclude DSA overheads\n");
+ 	rtnl_unlock();
+ }
+=20
  int dsa_master_setup(struct net_device *dev, struct dsa_port *cpu_dp)
  {
 +	int ret;
 +
+ 	dsa_master_set_mtu(dev,  cpu_dp);
+=20
  	/* If we use a tagging format that doesn't have an ethertype
  	 * field, make sure that all packets from this point on get
  	 * sent to the tag format's receive function.
@@@ -204,8 -201,8 +232,9 @@@
 =20
  void dsa_master_teardown(struct net_device *dev)
  {
 +	sysfs_remove_group(&dev->dev.kobj, &dsa_group);
  	dsa_master_ethtool_teardown(dev);
+ 	dsa_master_reset_mtu(dev);
 =20
  	dev->dsa_ptr =3D NULL;
 =20

--Sig_/v53H/qMN_qycCS0ws_ZtPnn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwNwdsACgkQAVBC80lX
0GyamQgAmjZgylhma/3BRD2UyxTFm1sN7sS0sZQQ2/s3NqkBkVlm5Xj3l80FW5kX
8rY2HKKNVJ9aI8UvE3LvjX/Gjij5Hq5bV895twzNl6lvF5L2lN9vpXDvFBG7VLWe
i1CdO4TcHmBFa+7BJSgof4Hl5ZQDRxUAh/6jEpqTwzHZyILbp4aeibran3hxQJkn
ad7RZO/QTboGSoFSDwtMcb7tXKrG6Y429X8XYYrNZcoEn73N5MgrKsmRlYPMOj/t
OCEX6wGGhdVYNmNAz5E0Ps9EoxpTs//ttE2KB8ZejNZ7JsZnYGmOomzgmo9gvYcm
g+IQpVvHcOwviqShR1/YqPyIEqyCXw==
=hVcU
-----END PGP SIGNATURE-----

--Sig_/v53H/qMN_qycCS0ws_ZtPnn--
