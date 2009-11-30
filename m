From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pxa tree build failure
Date: Mon, 30 Nov 2009 17:21:48 +1100
Message-ID: <20091130172148.1b2c527f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Nov_2009_17_21_48_+1100_GhQgsy61QS_Gq1e2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50438 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751383AbZK3GVp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Nov 2009 01:21:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Miao <eric.y.miao@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@marvell.com>

--Signature=_Mon__30_Nov_2009_17_21_48_+1100_GhQgsy61QS_Gq1e2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/video/backlight/da903x_bl.c: In function 'da903x_backlight_probe':
drivers/video/backlight/da903x_bl.c:134: error: 'dev' undeclared (first use=
 in this function)

Caused by commit ed084c0f6b7e003194276d74ef9087b78c180409 ("da903x_bl:
control WLED output current in da9034") which I have reverted for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Nov_2009_17_21_48_+1100_GhQgsy61QS_Gq1e2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksTZHwACgkQjjKRsyhoI8xC8wCfSBzafcfpuxZ90UY7uj8PpXaF
3TEAnjcyQp6iiCYfiS2XLhJ3gMo2LryI
=/ojB
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Nov_2009_17_21_48_+1100_GhQgsy61QS_Gq1e2--
