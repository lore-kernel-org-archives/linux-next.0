From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the gpio tree with the reset tree
Date: Fri, 13 Oct 2017 01:32:55 +0100
Message-ID: <20171013003255.teznbl43j76jorax@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="amo5zeqjrixg3nny"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:48212 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752644AbdJMAdF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Oct 2017 20:33:05 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Hoan Tran <hotran@apm.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--amo5zeqjrixg3nny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Today's linux-next merge of the gpio tree got a conflict in:

  MAINTAINERS

between commit:

  376349232a9364 ("ARC: reset: introduce AXS10x reset driver")

=66rom the reset tree and commit:

   a3c1295280c8a ("MAINTAINERS: Add entry for Synopsys DesignWare APB GPIO =
driver")

=66rom the gpio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc MAINTAINERS
index 310030b5b593,00c8be748ed2..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -12963,12 -12883,13 +12963,19 @@@ F:	arch/arc/plat-axs10
  F:	arch/arc/boot/dts/ax*
  F:	Documentation/devicetree/bindings/arc/axs10*
 =20
 +SYNOPSYS AXS10x RESET CONTROLLER DRIVER
 +M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
 +S:	Supported
 +F:	drivers/reset/reset-axs10x.c
 +F:	Documentation/devicetree/bindings/reset/snps,axs10x-reset.txt
 +
+ SYNOPSYS DESIGNWARE APB GPIO DRIVER
+ M:	Hoan Tran <hotran@apm.com>
+ L:	linux-gpio@vger.kernel.org
+ S:	Maintained
+ F:	drivers/gpio/gpio-dwapb.c
+ F:	Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
+=20
  SYNOPSYS DESIGNWARE DMAC DRIVER
  M:	Viresh Kumar <vireshk@kernel.org>
  M:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>

--amo5zeqjrixg3nny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlngCbYACgkQJNaLcl1U
h9CF2Af/ZXrs8gqhpDZ0mB8qlfsFwqyZItA8h3eXLtrpgz5J4mYQp5NogDT8TcuF
x2QKJYyX0Qouw6Z3DgYoO4MuBcc85qfDT5ciPihmgp2779uYyrUHtc3qRqEg4eP8
UQoWkAndeDaioWSOTahddg3D0V7dIN27qtkE6CMZO8phmIthAus9vSBDOGL1gdzN
Umns+JlNBKdCENccHeR7ki2oN4J0dz5ASOGjOd7xMp0whqSJLna+i0WBpt5rbBzy
6jAFDkD6S5aIRqOIMbSamrz2ETtFNcOtql9MqIuALNxnR1hlQiZo6b7NAYVji3Jo
xmVtY9VcMUUjE5xiKL3PRcRLKuc13g==
=9Fbu
-----END PGP SIGNATURE-----

--amo5zeqjrixg3nny--
