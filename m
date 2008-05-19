From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Tests tree not submitted?
Date: Mon, 19 May 2008 13:54:36 +1000
Message-ID: <20080519135436.34d6d593.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_May_2008_13_54_36_+1000_Hzj0I72NlhpAaWL_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33812 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754903AbYESDyu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 18 May 2008 23:54:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-next@vger.kernel.org

--Signature=_Mon__19_May_2008_13_54_36_+1000_Hzj0I72NlhpAaWL_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ananth, Sam,

Is there some reason that the tests tree changes have not bee submitted
to Linus yet?  They have been in linux-next for quite some time now
(since February 24) without any changes.

It currently only gets a conflict with lib/Kconfig.debug but that is easy
to fix up and I had to add a "depends on BLOCK" to the entry for "config
LKDTM" in the new tests/Kconfig file.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_May_2008_13_54_36_+1000_Hzj0I72NlhpAaWL_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMPoETgG2atn1QN8RAvw5AJ4oTYmkXvLW0zctBl5LeduVxEXS0gCfaoSx
EcAwqLcuzHpJ4TXTGDCfHOU=
=bm9M
-----END PGP SIGNATURE-----

--Signature=_Mon__19_May_2008_13_54_36_+1000_Hzj0I72NlhpAaWL_--
