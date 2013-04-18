From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Removal of GENERIC_GPIO breaks -next
Date: Thu, 18 Apr 2013 17:18:20 +1000
Message-ID: <20130418171820.7caa722158f243abb30bcb3c@canb.auug.org.au>
References: <CAAVeFu+fM=fJ2zp-gX4T07COMB31yvs74dXUqrw1LH09M7MXLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__18_Apr_2013_17_18_20_+1000_3QP+DYQ/99pmo4IF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:37493 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752566Ab3DRHSf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Apr 2013 03:18:35 -0400
In-Reply-To: <CAAVeFu+fM=fJ2zp-gX4T07COMB31yvs74dXUqrw1LH09M7MXLg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Shaveta Leekha <shaveta@freescale.com>, Christian Ruppert <christian.ruppert@abilis.com>, linux-next <linux-next@vger.kernel.org>, Kumar Gala <galak@kernel.crashing.org>, Doug Anderson <dianders@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, Wolfram Sang <w.sang@pengutronix.de>, Simon Glass <sjg@chromium.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>

--Signature=_Thu__18_Apr_2013_17_18_20_+1000_3QP+DYQ/99pmo4IF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Wed, 17 Apr 2013 19:37:33 +0900 Alexandre Courbot <gnurou@gmail.com> wro=
te:
>
> It seems like the last few patches I pushed to my branch are going to
> break powerpc/85xx due to a merge issue. I have tried to warn you by
> email today but maybe you haven't read it yet.
>=20
> arch/powerpc/platforms/85xx/Kconfig has a "select GENERIC_GPIO" which
> will cause compilation breakage because I removed the GENERIC_GPIO
> config option for all platforms. This line should be removed by my
> "Convert selectors of GENERIC_GPIO to GPIOLIB" patch, but this line
> slipped in between and is thus still here.
>=20
> Also arch/arc/plat-tb10x/Kconfig now defines GENERIC_GPIO, this will
> not cause breakage but should not be here anymore (ideally removed by
> the "Remove GENERIC_GPIO config option" patch)
>=20
> Apart from these two issues, things seem to have gone fine, but I'm
> not sure how they should be addressed and by who?

I have added the following two patches as merge fixups in linux-next.
You, or the maintainer of the tree with the conflicting patch will need
to send these (or something like them) to Linus when you ask him to pull.

For the clash with the galak tree (commit af7837c78d78
("powerpc/fsl-booke: Add B4_QDS board support")):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 18 Apr 2013 17:05:12 +1000
Subject: [PATCH] merge fix for Convert selectors of GENERIC_GPIO to GPIOLIB

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/platforms/85xx/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/8=
5xx/Kconfig
index fbb3eb9..102c29e 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -327,7 +327,6 @@ config B4_QDS
 	select PPC_E500MC
 	select PHYS_64BIT
 	select SWIOTLB
-	select GENERIC_GPIO
 	select ARCH_REQUIRE_GPIOLIB
 	select HAS_RAPIDIO
 	select PPC_EPAPR_HV_PIC

For the clash with the i2c tree (commit b81dfaa01f70 ("i2c: mux: Add
i2c-arb-gpio-challenge 'mux' driver")):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 18 Apr 2013 17:08:14 +1000
Subject: [PATCH] merge fix 2 for Convert selectors of GENERIC_GPIO to GPIOL=
IB

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/i2c/muxes/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index b5329b0..f7f9865 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -7,7 +7,7 @@ menu "Multiplexer I2C Chip support"
=20
 config I2C_ARB_GPIO_CHALLENGE
 	tristate "GPIO-based I2C arbitration"
-	depends on GENERIC_GPIO && OF
+	depends on GPIOLIB && OF
 	help
 	  If you say yes to this option, support will be included for an
 	  I2C multimaster arbitration scheme using GPIOs and a challenge &

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__18_Apr_2013_17_18_20_+1000_3QP+DYQ/99pmo4IF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRb548AAoJEECxmPOUX5FEhCsP/Ry6n2m7SstFpaaS4Ohm7ZDi
jXhn5c3h1OUyUnGsq056hj/v1msqfZJtZzbf/biXHAnUuikzXouS8ZjybKFT7JF5
fXRhZOMCXQ0r9+WNlhDkPZhDi/sCFdBnvGiDBLWMWePJq+vkCyvwiioq0VcjVPL+
cCowz9UNsXjXSq8IXQS9GelwiF7+zWQmuw7hhaPAq62JHRK3SupjainyWB9wE1q8
JTZFWKIvodr/GsrkshAsXn+KCSBDAE74j8/azXuSdthVPmwWUJBvgQaWpVBUwQX1
uN3uLHGXO40EI7RSOdAgamFSH7V9yDfs2M/G1eae2LCDBak9TT128uZV5M5L0Cmn
IcpF3il1DHSXdVBbl/hovXXb8zPP2be5YNnPvirXNbzGFK43rAJ71EV4RSVEY25/
qj13tLrNCHny4mdKfeVMQRYIfocZ4SGbkBeD0xVW39uSxi0uOIIzu7h1Ps1xNO3L
Za+1lX3EvXRJJ/dR/8ChBw9SLokRKIzO378Mg7kfANSlfLgJOUbQFXD/fk9W3QxA
Eb5X8JEEMHAvfVkMxoP24KU2SFHsRYgf058n54I0pGb9tCgKcwFHhScf2We6SX9X
KCKtD/C4H1ZAMHiA1RQv+LDrSgVSxFTGEouD2e1GX6dIAH658VATL/6Xz3wYzzXg
yOzChaTj3qQie06sOS8y
=/+Oa
-----END PGP SIGNATURE-----

--Signature=_Thu__18_Apr_2013_17_18_20_+1000_3QP+DYQ/99pmo4IF--
