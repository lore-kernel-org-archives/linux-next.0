From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: hid build failure
Date: Tue, 27 May 2008 13:14:41 +1000
Message-ID: <20080527131441.06f3a67f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__27_May_2008_13_14_41_+1000_cM+TwCTfLVSuuKsG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40899 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753830AbYE0DPF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 May 2008 23:15:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@jikos.cz>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>

--Signature=_Tue__27_May_2008_13_14_41_+1000_cM+TwCTfLVSuuKsG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/hid/usbhid/hiddev.c: In function 'hiddev_compat_ioctl':
drivers/hid/usbhid/hiddev.c:767: warning: passing argument 1 of 'hiddev_ioc=
tl' from incompatible pointer type
drivers/hid/usbhid/hiddev.c:767: warning: passing argument 2 of 'hiddev_ioc=
tl' makes integer from pointer without a cast
drivers/hid/usbhid/hiddev.c:767: error: too many arguments to function 'hid=
dev_ioctl'

Caused by commit f888433ea1f5dd6dc8487463c61c9e6d08e7ef62 ("HID: Switch
hiddev to unlocked_ioctl") which I have reverted.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__27_May_2008_13_14_41_+1000_cM+TwCTfLVSuuKsG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIO3ynTgG2atn1QN8RAgiFAJ9Wq1Hev2LKiimCt/u9gxb3T5ubLQCgl1Nx
+Y4t9KrNTSVbh7LVlrKgaEw=
=T681
-----END PGP SIGNATURE-----

--Signature=_Tue__27_May_2008_13_14_41_+1000_cM+TwCTfLVSuuKsG--
