From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree
Date: Tue, 14 Oct 2008 14:09:58 +1100
Message-ID: <20081014140958.9ab5af56.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_14_09_58_+1100_xXQHravS1aKo/x03"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38091 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755689AbYJNDMP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Oct 2008 23:12:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Hannes Reinecke <hare@suse.de>, Cornelia Huck <cornelia.huck@de.ibm.com>

--Signature=_Tue__14_Oct_2008_14_09_58_+1100_xXQHravS1aKo/x03
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/s390/net/claw.c between commit
b9d3aed7e1e50183085fcd2af643bf42d6b4bd95 ("[S390] more bus_id -> dev_name
conversions") from Linus' tree and commit
9ea9c3769253947978746fab5cab5df10bc1ee35 ("Driver core: Use
dev_get_drvdata() accessors") from the driver-core tree.

I fixed it up (see below).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/s390/net/claw.c
index 8f83fc9,328a521..0000000
--- a/drivers/s390/net/claw.c
+++ b/drivers/s390/net/claw.c
@@@ -581,10 -581,10 +581,10 @@@ claw_irq_handler(struct ccw_device *cde
 =20
  	CLAW_DBF_TEXT(4, trace, "clawirq");
          /* Bypass all 'unsolicited interrupts' */
- 	if (!cdev->dev.driver_data) {
+ 	if (!dev_get_drvdata(&cdev->dev)) {
                  printk(KERN_WARNING "claw: unsolicited interrupt for devi=
ce:"
  		 	"%s received c-%02x d-%02x\n",
 -		       cdev->dev.bus_id, irb->scsw.cmd.cstat,
 +		       dev_name(&cdev->dev), irb->scsw.cmd.cstat,
  		       irb->scsw.cmd.dstat);
  		CLAW_DBF_TEXT(2, trace, "badirq");
                  return;
@@@ -2880,10 -2879,9 +2880,10 @@@ claw_new_device(struct ccwgroup_device=20
  	int ret;
  	struct ccw_dev_id dev_id;
 =20
 -	printk(KERN_INFO "claw: add for %s\n",cgdev->cdev[READ]->dev.bus_id);
 +	printk(KERN_INFO "claw: add for %s\n",
 +	       dev_name(&cgdev->cdev[READ]->dev));
  	CLAW_DBF_TEXT(2, setup, "new_dev");
- 	privptr =3D cgdev->dev.driver_data;
+ 	privptr =3D dev_get_drvdata(&cgdev->dev);
  	cgdev->cdev[READ]->dev.driver_data =3D privptr;
  	cgdev->cdev[WRITE]->dev.driver_data =3D privptr;
  	if (!privptr)
@@@ -2990,8 -2986,8 +2990,8 @@@ claw_shutdown_device(struct ccwgroup_de
  	struct net_device *ndev;
  	int	ret;
 =20
 -	CLAW_DBF_TEXT_(2, setup, "%s", cgdev->dev.bus_id);
 +	CLAW_DBF_TEXT_(2, setup, "%s", dev_name(&cgdev->dev));
- 	priv =3D cgdev->dev.driver_data;
+ 	priv =3D dev_get_drvdata(&cgdev->dev);
  	if (!priv)
  		return -ENODEV;
  	ndev =3D priv->channel[READ].ndev;
@@@ -3020,11 -3016,11 +3020,11 @@@ claw_remove_device(struct ccwgroup_devi
  	struct claw_privbk *priv;
 =20
  	BUG_ON(!cgdev);
 -	CLAW_DBF_TEXT_(2, setup, "%s", cgdev->dev.bus_id);
 +	CLAW_DBF_TEXT_(2, setup, "%s", dev_name(&cgdev->dev));
- 	priv =3D cgdev->dev.driver_data;
+ 	priv =3D dev_get_drvdata(&cgdev->dev);
  	BUG_ON(!priv);
  	printk(KERN_INFO "claw: %s() called %s will be removed.\n",
 -			__func__,cgdev->cdev[0]->dev.bus_id);
 +			__func__, dev_name(&cgdev->cdev[0]->dev));
  	if (cgdev->state =3D=3D CCWGROUP_ONLINE)
  		claw_shutdown_device(cgdev);
  	claw_remove_files(&cgdev->dev);

--Signature=_Tue__14_Oct_2008_14_09_58_+1100_xXQHravS1aKo/x03
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0DYYACgkQjjKRsyhoI8ykzwCfda8gbH09dmVEpM7MCFCvp1/o
FJEAoIYrogpIA1szebFpXTy4ee/Rl5oj
=JLLE
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_14_09_58_+1100_xXQHravS1aKo/x03--
