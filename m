From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build warning
Date: Fri, 19 Jun 2009 11:13:59 +1000
Message-ID: <20090619111359.b317a533.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__19_Jun_2009_11_13_59_+1000_lPXwYaWHH+Ex2mA/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57796 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751625AbZFSBOJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Jun 2009 21:14:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Fri__19_Jun_2009_11_13_59_+1000_lPXwYaWHH+Ex2mA/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

drivers/video/s1d13xxxfb.c:420: warning: 'bltbit_wait_bitset' defined but n=
ot used
drivers/video/s1d13xxxfb.c:463: warning: 'bltbit_fifo_status' defined but n=
ot used

Introduced by commit 3ed167af96ed098187ea41353fe02d1af20d38a1 ("fbdev:
s1d13xxxfb: add accelerated bitblt functions").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__19_Jun_2009_11_13_59_+1000_lPXwYaWHH+Ex2mA/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko65lcACgkQjjKRsyhoI8xKWQCfSn9Ir/OQ9FxIPQaZlPaUmTO2
MZUAn0zZOkqsoS28I9gc7AigrYzJ9uLS
=fOLv
-----END PGP SIGNATURE-----

--Signature=_Fri__19_Jun_2009_11_13_59_+1000_lPXwYaWHH+Ex2mA/--
