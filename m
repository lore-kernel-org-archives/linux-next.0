From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s5p tree with the arm tree
Date: Tue, 22 Nov 2011 13:05:12 +1100
Message-ID: <20111122130512.08ced601a96038308e5149ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__22_Nov_2011_13_05_12_+1100_fksGrm1ldnrgsjHG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:33012 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753497Ab1KVCFc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Nov 2011 21:05:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Russell King <rmk@arm.linux.org.uk>, Thomas Abraham <thomas.abraham@linaro.org>

--Signature=_Tue__22_Nov_2011_13_05_12_+1100_fksGrm1ldnrgsjHG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kukjin,

Today's linux-next merge of the s5p tree got a conflict in
arch/arm/mach-exynos/include/mach/entry-macro.S between commit
4e44d2cb95bd ("ARM: exynos4: convert to CONFIG_MULTI_IRQ_HANDLER") from
the arm tree and commit 3a7c87154294 ("ARM: SAMSUNG: Move timer irq numbers
to end of linux irq space") from the s5p tree.

The former removed the code modified by the latter, so I did that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__22_Nov_2011_13_05_12_+1100_fksGrm1ldnrgsjHG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOywNYAAoJEECxmPOUX5FErtwQAKJR1ALjcZQw1ZST8w0xscHA
RWJk+x5XVeYoN0pwU2hXkDSCubtP513mtt3voiXo0X4IzMthj6UtT4d2EQTPWtkg
GR0Bdl0RTp/Abo8aYuKaznJkA1E+DxSTbSTxaOQd0UarcgEr2DrPyQh3jtA6313V
naUoLIE01Z2Vd+jzIfVYIsWij0nS+xacv+aUSN0ljte4HTDrsuJYQfbyW9mVN1wy
v4tYLYZ1T7Sm9tllJYEpfsYLhP2TQchiiDgs5bR95/41KpLqVrLwPRA7xlVUnSjN
s2OisBeBeS9ervbzX+c9mxbFcLQ3nh/pWTcdD36+MLIZjPBChQb40DvwWElIu28i
g9W+Ak50vGD/BVvF/zNFPvTVrdMD7WVPEMPrRQ0ofFawjg2DkUSOMUOBWVfX77zM
nAPwoiq+259N65MrNy2nQ7eEb7UAjWUr2jP6DdoADR/eZ+2yl5zIBgom4YxySD0b
NdRLXy1d1fX+fWG6A7L0+r47aVcEpCssQJUgSD3UhQb3nqO+kCb8iA7vZvFI9duL
rYezolHKsewRpSaQbwXZ8DCe/PyJkDz/qJdDhcsV3ka/Cchmtplzc90MdbhU1AJD
/1aiMHX0S+Z2I6xUtYSvTdJc1t7miDWp4F7dpFoIGlS8nZqqL0i0/QXaov5dYc4r
ogRyjGeOicBIs6qDozKV
=h1Vp
-----END PGP SIGNATURE-----

--Signature=_Tue__22_Nov_2011_13_05_12_+1100_fksGrm1ldnrgsjHG--
