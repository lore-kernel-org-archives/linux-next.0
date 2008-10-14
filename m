From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree
Date: Tue, 14 Oct 2008 14:05:52 +1100
Message-ID: <20081014140552.be51ba7f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_14_05_52_+1100_Rfdb+gSKJfhoeyWy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38081 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755654AbYJNDMI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Oct 2008 23:12:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

--Signature=_Tue__14_Oct_2008_14_05_52_+1100_Rfdb+gSKJfhoeyWy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/s390/char/vmlogrdr.c between commit
2a0217d5c7d22d6dd28f8ae5d20b06d24dc426b8 ("[S390] bus_id -> dev_name
conversions") from Linus' tree and commit
1ad49a066d3a1627b7a640117804a1058fc55aa0 ("device create: s390: convert
device_create_drvdata to device_create") from the driver-core tree.

I fixed it up (see below).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/s390/char/vmlogrdr.c
index 42173cc,9775acb..0000000
--- a/drivers/s390/char/vmlogrdr.c
+++ b/drivers/s390/char/vmlogrdr.c
@@@ -747,10 -748,10 +747,10 @@@ static int vmlogrdr_register_device(str
  		device_unregister(dev);
  		return ret;
  	}
- 	priv->class_device =3D device_create_drvdata(vmlogrdr_class, dev,
- 						   MKDEV(vmlogrdr_major,
- 							 priv->minor_num),
- 						   priv, "%s", dev_name(dev));
+ 	priv->class_device =3D device_create(vmlogrdr_class, dev,
+ 					   MKDEV(vmlogrdr_major,
+ 						 priv->minor_num),
 -					   priv, "%s", dev->bus_id);
++					   priv, "%s", dev_name(dev));
  	if (IS_ERR(priv->class_device)) {
  		ret =3D PTR_ERR(priv->class_device);
  		priv->class_device=3DNULL;

--Signature=_Tue__14_Oct_2008_14_05_52_+1100_Rfdb+gSKJfhoeyWy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0DJAACgkQjjKRsyhoI8ze7ACggkz7i5gcF/kXVoqw7oQdXP5E
LfcAoJt3wyr/HjWVTSyVwsIMx4NbpXZi
=IrIB
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_14_05_52_+1100_Rfdb+gSKJfhoeyWy--
