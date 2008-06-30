From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build failure
Date: Tue, 1 Jul 2008 00:35:07 +1000
Message-ID: <20080701003507.082071bb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_00_35_07_+1000_lNRswSCem=qYywYx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45342 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751650AbYF3OfM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 10:35:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Oliver Neukum <oliver@neukum.org>

--Signature=_Tue__1_Jul_2008_00_35_07_+1000_lNRswSCem=qYywYx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (powerpc g5_defconfig) failed like this:

drivers/usb/class/cdc-acm.c: In function 'acm_suspend':
drivers/usb/class/cdc-acm.c:1263: error: 'struct usb_device' has no member =
named 'auto_pm'

Caused by commit 6a5aa976ea24ea5fe616e278e80d8986a159c1c1 ("USB:
additional power savings for cdc-acm devices that support remote wakeup")
(from the usb tree) and the lack of CCONFIG_PM ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_00_35_07_+1000_lNRswSCem=qYywYx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkho7xsACgkQjjKRsyhoI8yrpgCfVE3a9lGUTVSh0WM/k3p3HRsx
sxAAn1Jjb6XpbKDS8ju6jAAL+YMwiCFL
=a0J8
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_00_35_07_+1000_lNRswSCem=qYywYx--
