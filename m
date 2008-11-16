From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sh tree build warning
Date: Mon, 17 Nov 2008 10:34:46 +1100
Message-ID: <20081117103446.e5c66fec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__17_Nov_2008_10_34_46_+1100_HDsNCp=fWF0aAIyE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43901 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751327AbYKPXez (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Nov 2008 18:34:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: linux-next@vger.kernel.org, Magnus Damm <damm@igel.co.jp>

--Signature=_Mon__17_Nov_2008_10_34_46_+1100_HDsNCp=fWF0aAIyE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next build (x86_64 allmodconfig) produced these warning:

drivers/usb/gadget/m66592-udc.c: In function 'm66592_probe':
drivers/usb/gadget/m66592-udc.c:1672: warning: label 'clean_up2' defined bu=
t not used
drivers/usb/host/r8a66597-hcd.c: In function 'r8a66597_probe':
drivers/usb/host/r8a66597-hcd.c:2401: warning: label 'clean_up2' defined bu=
t not used

Added by commit 985fc7c81c7852f2e104c71cbe913ace683c9e6a ("sh: sh_mobile
usbf clock framework support").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__17_Nov_2008_10_34_46_+1100_HDsNCp=fWF0aAIyE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkgrhYACgkQjjKRsyhoI8yHGwCfbv0nITakMBSiaBU8Sdi9zQVY
XngAn1xZhziDac3Wrksf9bFebo2aqBPf
=6VnB
-----END PGP SIGNATURE-----

--Signature=_Mon__17_Nov_2008_10_34_46_+1100_HDsNCp=fWF0aAIyE--
