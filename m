From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the watchdog tree with Linus' tree
Date: Wed, 26 May 2010 13:38:15 +1000
Message-ID: <20100526133815.e62bacb8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__26_May_2010_13_38_15_+1000_qzyJtmga.LeHPtsq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33080 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759184Ab0EZDiX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 May 2010 23:38:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wim Van Sebroeck <wim@iguana.be>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <w.sang@pengutronix.de>, Linus <torvalds@linux-foundation.org>

--Signature=_Wed__26_May_2010_13_38_15_+1000_qzyJtmga.LeHPtsq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Wim,

Today's linux-next merge of the watchdog tree got a conflict in
drivers/watchdog/imx2_wdt.c between commit
bb2fd8a844d3a9209599b5fb694b30ac46a56ef0 ("watchdog: Driver for the
watchdog timer on Freescale IMX2 (and later) processors") from Linus'
tree and commit 1216b28847276929d920296e34b4e8226eaf4e79 ("watchdog:
Driver for the watchdog timer on Freescale IMX2 (and later) processors")
from the watchdog tree.

These are two versions of the same patch.  I used the version from Linus'
tree - but I do need to ask what is the point of having a patch in
linux-next for two days and then submitting a different version of the
patch to Linus?  The changes are not insignificant. Both patches have the
same Author date and SOB etc lines.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__26_May_2010_13_38_15_+1000_qzyJtmga.LeHPtsq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkv8l6cACgkQjjKRsyhoI8xDAQCeOJ0rmCYvD19j4Rfvaxy0w3Z9
/BoAoJnxvap5bNEt7/jjLPugcRAFIB++
=Iq4a
-----END PGP SIGNATURE-----

--Signature=_Wed__26_May_2010_13_38_15_+1000_qzyJtmga.LeHPtsq--
