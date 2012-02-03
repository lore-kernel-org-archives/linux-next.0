From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (regulator
 tree related)
Date: Fri, 3 Feb 2012 16:15:22 +1100
Message-ID: <20120203161522.c079159878788e9ba7e7b242@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__3_Feb_2012_16_15_22_+1100_GPH5.6XXqENwTY_b"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:39216 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750718Ab2BCFPh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Feb 2012 00:15:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

--Signature=_Fri__3_Feb_2012_16_15_22_+1100_GPH5.6XXqENwTY_b
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/mfd/twl-core.c: In function 'add_children':
drivers/mfd/twl-core.c:752:10: error: 'struct regulator_consumer_supply' ha=
s no member named 'dev'
drivers/mfd/twl-core.c:753:10: error: 'struct regulator_consumer_supply' ha=
s no member named 'dev'
drivers/mfd/twl-core.c:754:10: error: 'struct regulator_consumer_supply' ha=
s no member named 'dev'
drivers/mfd/twl-core.c:800:10: error: 'struct regulator_consumer_supply' ha=
s no member named 'dev'

Caused by commit 737f360d5bef ("regulator: Remove support for supplies
specified by struct device").

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__3_Feb_2012_16_15_22_+1100_GPH5.6XXqENwTY_b
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPK21qAAoJEECxmPOUX5FEv5oP/jxNJaJs0NxvJqrfJDOaoW1q
DPaWq8gsW6+tdPyVcvLaDDgZ2xlxSB5wD73GCcTkGbVyYT11cMsclhE/bek5QI0x
aj+Qw0b4LFHVq2FtvEyziNDQp4RHgFydFWnQdk0yla8sSYGUz6Knm2zAEIAdSNZR
52RLrSm9up2lz/DJnNPb0Vhrz6je4cHR4p4CKyjhlHSxRjLXSXf/KJyeMdg9EV3f
WGYeH7OHqbhrvM4AmIZbsyA7y3MoYGNsEBvfZ7KSOlphEdJAlrHDXknQVaaKpS17
iPXblePTRrtj2NeDVJSrUGJoHGGpqcWWKuEK8y5ZPuGqb3043APSi1cwrlEaOVjz
fv/A8PwP6rrittFPsRPNiZQJ4RKaBbxBGN/qEEZxCap+R2R8w40+qV7XWEEJ7GJF
Z8j8WjBALYQJMfxgWYOVpA7V80fldQ5WJSOxuzfhkGaRKa3jBdK3mYtID0pvuoh5
lJAFpXR06Kbgfac+iq15ijjyyTiduKk5PXrLQonaovzyST6bBjtAlKfQ+u+hrRdC
4HSY6TCPmsAB1JbM62Jovc/CrWKCTTgrgysmdjEo2sR1RmtZs+ElSXUQO6GnAsbT
fPztpE9qW51xZLDQaqMAGm+TTDaSEQCgd27J1ywaGd/wGDqaKauwkdrhPq9RPoEl
ajD2VIaN3OT7XDuD+BKf
=QWU8
-----END PGP SIGNATURE-----

--Signature=_Fri__3_Feb_2012_16_15_22_+1100_GPH5.6XXqENwTY_b--
