From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: mfd tree build warning
Date: Tue, 24 Nov 2009 16:42:19 +1100
Message-ID: <20091124164219.c5d54461.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Nov_2009_16_42_19_+1100_hESVTDJL8X.Mjlkr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35269 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752619AbZKXFmR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Nov 2009 00:42:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__24_Nov_2009_16_42_19_+1100_hESVTDJL8X.Mjlkr
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

I have been getting these warnings from the x86_64 allmodconfig build for
a long time:

drivers/mfd/wm8350-regmap.c:3177:2: warning: #warning No WM8350 config mode=
s supported - select at least one of the
drivers/mfd/wm8350-regmap.c:3178:2: warning: #warning MFD_WM8350_CONFIG_MOD=
E_n options from the board driver.

This may not be a problem, I just thought I should let you know.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_Nov_2009_16_42_19_+1100_hESVTDJL8X.Mjlkr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksLcjsACgkQjjKRsyhoI8xMywCeL0QpNTk0gSQktpfeoNKkljFr
ZPsAn1Co8EgtdkFBYee7WgxbtrFy9MDv
=7/1S
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Nov_2009_16_42_19_+1100_hESVTDJL8X.Mjlkr--
