From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: mfd tree build failure
Date: Wed, 6 Aug 2008 00:08:56 +1000
Message-ID: <20080806000856.a5609577.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__6_Aug_2008_00_08_56_+1000_kXJ6ISu6psPaPn_t"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49713 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753175AbYHEOJI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 10:09:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@openedhand.com>
Cc: linux-next@vger.kernel.org, Ian Molton <spyro@f2s.com>, "David S. Miller" <davem@davemloft.net>

--Signature=_Wed__6_Aug_2008_00_08_56_+1000_kXJ6ISu6psPaPn_t
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

Today's linux-next build (sparc allmodconfig) failed like this:

drivers/mfd/t7l66xb.c:167: error: implicit declaration of function `get_irq=
_data'
drivers/mfd/t7l66xb.c:177: error: implicit declaration of function `generic=
_handle_irq'
drivers/mfd/t7l66xb.c:182: error: implicit declaration of function `get_irq=
_chip_data'
drivers/mfd/t7l66xb.c:224: error: implicit declaration of function `set_irq=
_chip'
drivers/mfd/t7l66xb.c:225: error: implicit declaration of function `set_irq=
_chip_data'
drivers/mfd/t7l66xb.c:226: error: implicit declaration of function `set_irq=
_handler'
drivers/mfd/t7l66xb.c:226: error: `handle_level_irq' undeclared (first use =
in this function)
drivers/mfd/t7l66xb.c:226: error: (Each undeclared identifier is reported o=
nly once
drivers/mfd/t7l66xb.c:226: error: for each function it appears in.)
drivers/mfd/t7l66xb.c:232: error: implicit declaration of function `set_irq=
_type'
drivers/mfd/t7l66xb.c:233: error: implicit declaration of function `set_irq=
_data'
drivers/mfd/t7l66xb.c:234: error: implicit declaration of function `set_irq=
_chained_handler'

This has actually been happening since Aug 1.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__6_Aug_2008_00_08_56_+1000_kXJ6ISu6psPaPn_t
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiYXvgACgkQjjKRsyhoI8wjTACfacFT8pVzac3miUgl49iXAg7b
PGoAn37XZcMcojZWhIt6sWWkQuEGhcKF
=qHiX
-----END PGP SIGNATURE-----

--Signature=_Wed__6_Aug_2008_00_08_56_+1000_kXJ6ISu6psPaPn_t--
