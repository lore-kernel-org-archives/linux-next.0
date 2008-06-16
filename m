From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: arm build failure
Date: Mon, 16 Jun 2008 16:07:47 +1000
Message-ID: <20080616160747.27909f11.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Jun_2008_16_07_47_+1000_=TSdDfgfGPf7ZMKA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39102 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751012AbYFPGIB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Jun 2008 02:08:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>

--Signature=_Mon__16_Jun_2008_16_07_47_+1000_=TSdDfgfGPf7ZMKA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/mfd/tc6393xb.c:91: error: field 'gpio' has incomplete type
drivers/mfd/tc6393xb.c: In function 'tc6393xb_gpio_get':
drivers/mfd/tc6393xb.c:116: warning: type defaults to 'int' in declaration =
of '__mptr'
drivers/mfd/tc6393xb.c:116: warning: initialization from incompatible point=
er type
drivers/mfd/tc6393xb.c: In function '__tc6393xb_gpio_set':
drivers/mfd/tc6393xb.c:126: warning: type defaults to 'int' in declaration =
of '__mptr'
drivers/mfd/tc6393xb.c:126: warning: initialization from incompatible point=
er type
drivers/mfd/tc6393xb.c: In function 'tc6393xb_gpio_set':
drivers/mfd/tc6393xb.c:141: warning: type defaults to 'int' in declaration =
of '__mptr'
drivers/mfd/tc6393xb.c:141: warning: initialization from incompatible point=
er type
drivers/mfd/tc6393xb.c: In function 'tc6393xb_gpio_direction_input':
drivers/mfd/tc6393xb.c:154: warning: type defaults to 'int' in declaration =
of '__mptr'
drivers/mfd/tc6393xb.c:154: warning: initialization from incompatible point=
er type
drivers/mfd/tc6393xb.c: In function 'tc6393xb_gpio_direction_output':
drivers/mfd/tc6393xb.c:172: warning: type defaults to 'int' in declaration =
of '__mptr'
drivers/mfd/tc6393xb.c:172: warning: initialization from incompatible point=
er type
drivers/mfd/tc6393xb.c: In function 'tc6393xb_register_gpio':
drivers/mfd/tc6393xb.c:199: error: implicit declaration of function 'gpioch=
ip_add'
drivers/mfd/tc6393xb.c: In function 'tc6393xb_attach_irq':
drivers/mfd/tc6393xb.c:272: error: implicit declaration of function 'set_ir=
q_flags'
drivers/mfd/tc6393xb.c:272: error: 'IRQF_VALID' undeclared (first use in th=
is function)
drivers/mfd/tc6393xb.c:272: error: (Each undeclared identifier is reported =
only once
drivers/mfd/tc6393xb.c:272: error: for each function it appears in.)
drivers/mfd/tc6393xb.c:272: error: 'IRQF_PROBE' undeclared (first use in th=
is function)
drivers/mfd/tc6393xb.c:275: error: 'IRQT_FALLING' undeclared (first use in =
this function)
drivers/mfd/tc6393xb.c: In function 'tc6393xb_probe':
drivers/mfd/tc6393xb.c:423: error: implicit declaration of function 'gpioch=
ip_remove'

I have reverted the commit that added this driver
(ed1f4e8e88fcf43dd1679968477a6139d53bc852 "[ARM] 5096/1: Support Toshiba
TC6393XB Mobile I/O Controller" from the arm tree) for now.  I suspect
that it needs some dependencies in it Kconfig.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Jun_2008_16_07_47_+1000_=TSdDfgfGPf7ZMKA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEUEARECAAYFAkhWAzMACgkQTgG2atn1QN9I/wCYw+wlC8WhxEIvcMkNlPmMdl+l
0ACgkA9LjbJsMMyKiW8sCwa3JAijtyY=
=Tyri
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Jun_2008_16_07_47_+1000_=TSdDfgfGPf7ZMKA--
