From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: arm build failure
Date: Fri, 20 Mar 2009 10:27:26 +1100
Message-ID: <20090320102726.83f0b6d3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Mar_2009_10_27_26_+1100_Tw9DxoXkJyB+MRGd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60984 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755524AbZCSX1f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 19:27:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__20_Mar_2009_10_27_26_+1100_Tw9DxoXkJyB+MRGd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

The linux-next build of mx1ads_defconfig has been failing like this since
next-20090316:

arch/arm/mach-imx/generic.c:32:24: error: mach/imxfb.h: No such file or dir=
ectory

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Mar_2009_10_27_26_+1100_Tw9DxoXkJyB+MRGd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknC1N4ACgkQjjKRsyhoI8yLngCfa+Orrtt6cmT3OK+QPMSsJSOD
iJIAoKtER4MzfhbNiDMkFoDk2C8wRACs
=JAJr
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Mar_2009_10_27_26_+1100_Tw9DxoXkJyB+MRGd--
