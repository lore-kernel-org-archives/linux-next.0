From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree
Date: Tue, 14 Oct 2008 14:02:10 +1100
Message-ID: <20081014140210.c4025160.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_14_02_10_+1100_WL5jmV4tfOICe.Ru"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38077 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755688AbYJNDMF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Oct 2008 23:12:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Cornelia Huck <cornelia.huck@de.ibm.com>

--Signature=_Tue__14_Oct_2008_14_02_10_+1100_WL5jmV4tfOICe.Ru
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/s390/char/raw3270.c between commit
b9d3aed7e1e50183085fcd2af643bf42d6b4bd95 ("[S390] more bus_id -> dev_name
conversions") from Linus' tree and commit
1ad49a066d3a1627b7a640117804a1058fc55aa0 ("device create: s390: convert
device_create_drvdata to device_create") from the driver-core tree.

I fixed it up (see below).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/s390/char/raw3270.c
index 1792b2c,abe17d4..0000000
--- a/drivers/s390/char/raw3270.c
+++ b/drivers/s390/char/raw3270.c
@@@ -1168,19 -1168,17 +1168,17 @@@ static int raw3270_create_attributes(st
  	if (rc)
  		goto out;
 =20
- 	rp->clttydev =3D device_create_drvdata(class3270, &rp->cdev->dev,
- 					     MKDEV(IBM_TTY3270_MAJOR, rp->minor),
- 					     NULL,
- 					     "tty%s", dev_name(&rp->cdev->dev));
+ 	rp->clttydev =3D device_create(class3270, &rp->cdev->dev,
+ 				     MKDEV(IBM_TTY3270_MAJOR, rp->minor), NULL,
 -				     "tty%s", rp->cdev->dev.bus_id);
++				     "tty%s", dev_name(&rp->cdev->dev));
  	if (IS_ERR(rp->clttydev)) {
  		rc =3D PTR_ERR(rp->clttydev);
  		goto out_ttydev;
  	}
 =20
- 	rp->cltubdev =3D device_create_drvdata(class3270, &rp->cdev->dev,
- 					     MKDEV(IBM_FS3270_MAJOR, rp->minor),
- 					     NULL,
- 					     "tub%s", dev_name(&rp->cdev->dev));
+ 	rp->cltubdev =3D device_create(class3270, &rp->cdev->dev,
+ 				     MKDEV(IBM_FS3270_MAJOR, rp->minor), NULL,
 -				     "tub%s", rp->cdev->dev.bus_id);
++				     "tub%s", dev_name(&rp->cdev->dev));
  	if (!IS_ERR(rp->cltubdev))
  		goto out;
 =20

--Signature=_Tue__14_Oct_2008_14_02_10_+1100_WL5jmV4tfOICe.Ru
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0C7IACgkQjjKRsyhoI8z2mQCfUF3Wa6WIk5coUJAf4Cecl1TL
CkgAn3KmiTeCMNaRIm7XgzPz8S9TLM42
=k06f
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_14_02_10_+1100_WL5jmV4tfOICe.Ru--
