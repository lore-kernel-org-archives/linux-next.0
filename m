From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Fri, 7 Dec 2018 12:39:26 +1100
Message-ID: <20181207123926.0f82b9e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/g+AEpj1my40rM4hE6m5k1.V"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-next.vger.kernel.org

--Sig_/g+AEpj1my40rM4hE6m5k1.V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/dsa/master.c

between commit:

  a3d7e01da060 ("net: dsa: Fix tagging attribute location")

from the net tree and commit:

  dc0fe7d47f9f ("net: dsa: Set the master device's MTU to account for DSA o=
verheads")

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
index 5e8c9bef78bd,42f525bc68e2..000000000000
--- a/net/dsa/master.c
+++ b/net/dsa/master.c
@@@ -158,31 -158,24 +158,47 @@@ static void dsa_master_ethtool_teardown
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
+ void dsa_master_set_mtu(struct net_device *dev, struct dsa_port *cpu_dp)
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
  int dsa_master_setup(struct net_device *dev, struct dsa_port *cpu_dp)
  {
 +	int ret;
 +
+ 	dsa_master_set_mtu(dev,  cpu_dp);
+=20
  	/* If we use a tagging format that doesn't have an ethertype
  	 * field, make sure that all packets from this point on get
  	 * sent to the tag format's receive function.

--Sig_/g+AEpj1my40rM4hE6m5k1.V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwJz04ACgkQAVBC80lX
0GwtLwgAnR3stvtENL8oloWFqae8YsHD8QIXx+0L6Zxu/lCNGz61IBfqfCVo9bMg
AOg5lWEpSM7Nd6rqFYdMcL3uAgsCUq0OGpz0iqYs5D4aNhEfE2DEJIu+aQI+rg2t
PInfToMrVI2bD3fVbMoDblUyknkOoVdtn47855Z/Ak5Uz3iyjNAFD5+QwdARxqr1
cVbV3abF8b3sGM/4iNX4Ddo8HgNmU/e0tGjYPpz9K+XFxP8vPs62t7gTNtr7QKbj
g6zmRuzvXqa1xnwiUV+T0vK5TzGjbiHMZUxMqokZcWP0MZ365tq60wNzILFDjK64
hTkGMHlDXAPVQEG1k03Qh5ahEVEWQw==
=6QWn
-----END PGP SIGNATURE-----

--Sig_/g+AEpj1my40rM4hE6m5k1.V--
