From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mtd tree with Linus' tree
Date: Fri, 27 May 2011 14:00:18 +1000
Message-ID: <20110527140018.993fe260.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_May_2011_14_00_18_+1000_iitzuqMchArucSti"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51877 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750800Ab1E0EAb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 May 2011 00:00:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jamie Iles <jamie@jamieiles.com>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Fri__27_May_2011_14_00_18_+1000_iitzuqMchArucSti
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the mtd tree got a conflict in
drivers/mtd/maps/integrator-flash.c between commit adf0040096e4 ("ARM:
6906/1: MTD: Remove integrator-flash") from Linus' tree and commit
ee0e87b174bb ("mtd: convert remaining users to mtd_device_register()")
from the mtd tree.

The former removes the file updated by the latter, so I just removed it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_May_2011_14_00_18_+1000_iitzuqMchArucSti
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN3yHSAAoJEDMEi1NhKgbsvNIIAJWfL5ItVP+aN0y6QxD7NUl9
Ll5KVJR5WyRVV4bg9J9FZxKZ7VvodvzgrtS4UaHLCy7swuUmxVxqNnOvoyJBy9NI
20Dd2OeI90PKAIcmSx4PlKokK5ROx7b2OW2Y0sEzA+aD+d2C5NOlQ5Tz0OWfbAtq
r61Ety992vK0svB9UWyaWcxVq24f+CoVY8xk31mpmD62m57UH8JorX2UQNc+lkkZ
ZDy3UyzE36ZADN4jzpeD6IkQqAYnMaFFU+SphwWXl2at/Bng1mEpjQuAOp+LSfiy
8AMhfqNYwZIlMkC5gvHbqRX6I8c1MDqelkcNBNT5+HW8VPmZlOoYfpj7nzlZ0nI=
=+y0V
-----END PGP SIGNATURE-----

--Signature=_Fri__27_May_2011_14_00_18_+1000_iitzuqMchArucSti--
