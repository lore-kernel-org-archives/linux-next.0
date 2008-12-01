From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Mon, 1 Dec 2008 14:26:23 +1100
Message-ID: <20081201142623.5c38680b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Dec_2008_14_26_23_+1100_Jg_aC4l/po5bGTcL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57247 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751499AbYLAD0o (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 30 Nov 2008 22:26:44 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Al Viro <viro@ftp.linux.org.uk>, Mike Frysinger <vapier@gentoo.org>, Jeff Garzik <jgarzik@redhat.com>

--Signature=_Mon__1_Dec_2008_14_26_23_+1100_Jg_aC4l/po5bGTcL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
drivers/net/smc91x.c between commit
f57628d76bd201a444ca822f3622522a44acbf60 ("section errors in
smc911x/smc91x") from Linus' tree and commit smc_drv_probe ("smc91x: add
__init markings to smc_drv_probe()") from the net tree.

The former changed smc_drv_probe() to __devinit while the latter to
__init.  I used the latter and it can be fixed up in your tree.

I do wonder why the former change didn't go through Jeff's tree ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Dec_2008_14_26_23_+1100_Jg_aC4l/po5bGTcL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkzWV8ACgkQjjKRsyhoI8wkOwCfcpEf0N4bMk8V27JhXud87AAD
E5IAnRMmSadAE1CgjFH91chJR1+ERt16
=aRKy
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Dec_2008_14_26_23_+1100_Jg_aC4l/po5bGTcL--
